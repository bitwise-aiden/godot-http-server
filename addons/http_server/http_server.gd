class_name HTTPServer extends TCPServer


# Public constants

const Method = preload("res://addons/http_server/method.gd")
const Request = preload("res://addons/http_server/request.gd")
const Response = preload("res://addons/http_server/response.gd")
const Status = preload("res://addons/http_server/status.gd")


# Private variables

var __endpoints: Dictionary = {
	# key: [Int, String], array with 0 index representing method, 1 index representing endpoint
	# value: Callable, reference to function to call
}
var __fallback: Callable
var __server: TCPServer = null


# Public methods

func endpoint(type: int, endpoint: String, function: Callable) -> void:
	var endpoint_hash: Array = [type, endpoint]
	if endpoint_hash in __endpoints:
		print(
			"[ERR] Endpoint already defined type: %s, endpoint: %s" % [
				Method.type_to_identifier(type),
				endpoint,
			]
		)
		return

	__endpoints[endpoint_hash] = function


func fallback(function: Callable) -> void:
	__fallback = function


func __take_connection() -> StreamPeerTCP:
	if !is_listening():
		print(
			"[ERR] Server is not listening, please initialize and listen before calling `take_connection`"
		)
		return null

	var connection: StreamPeerTCP = take_connection()

	if connection:
		__process_connection(connection)

	return connection


# Private methods

func __process_connection(connection: StreamPeerTCP) -> void:
	var content: PackedByteArray = PackedByteArray([])

	while true:
		var bytes = connection.get_available_bytes()
		if bytes == 0:
			break

		var data = connection.get_partial_data(bytes)
		content.append_array(data[1])

	if content.is_empty():
		return

	var content_string: String = content.get_string_from_utf8()
	var content_parts: Array = content_string.split("\r\n")

	if content_parts.is_empty():
		connection.put_data(__response_from_status(Status.BAD_REQUEST).to_utf8_buffer())
		return

	var request_line = content_parts[0]
	var request_line_parts = request_line.split(" ")

	var method: String = request_line_parts[0]
	var endpoint: String = request_line_parts[1]

	var headers: Dictionary = {}
	var header_index: int = content_parts.find("")

	if header_index == -1:
		print(
			"[ERR] Error parsing request data: %s" % [str(content)]
		)
		connection.put_data(__response_from_status(Status.BAD_REQUEST).to_utf8_buffer())
		return

	for i in range(1, header_index):
		var header_parts: Array = content_parts[i].split(":", true, 1)
		var header = header_parts[0].strip_edges().to_lower()
		var value = header_parts[1].strip_edges()

		headers[header] = value

	var body: String = ""
	if header_index != content_parts.size() - 1:
		var body_parts: Array = content_parts.slice(header_index + 1, content_parts.size())
		body = "\r\n".join(PackedStringArray(body_parts))

	var response: Response = __process_request(method, endpoint, headers, body)
	connection.put_data(response.to_utf8_buffer())


func __process_request(method: String, endpoint: String, headers: Dictionary, body: String) -> Response:
	var type: int = Method.description_to_type(method)

	var request: Request = Request.new(
		type,
		endpoint,
		headers,
		body
	)

	var endpoint_func: Callable
	var endpoint_parts: PackedStringArray = endpoint.split("/", false)

	while endpoint_func.is_null():
		var endpoint_hash: Array = [type, "/" + "/".join(endpoint_parts)]
		if __endpoints.has(endpoint_hash):
			endpoint_func = __endpoints[endpoint_hash]
		elif endpoint_parts.is_empty():
			break
		else:
			endpoint_parts.remove_at(endpoint_parts.size() - 1)

	if endpoint_func.is_null():
		print(
			"[WRN] Recieved request for unknown endpoint, method: %s, endpoint: %s" % [method, endpoint]
		)
		if __fallback:
			endpoint_func = __fallback
		else:
			return __response_from_status(Status.NOT_FOUND)

	var response: Response = Response.new()

	if endpoint_func.is_null():
		print(
			"[ERR] Callable for endpoint not valid, method: %s, endpoint: %s" % [method, endpoint]
		)
	else:
		print(
			"[INF] Recieved request method: %s, endpoint: %s" % [method, endpoint]
		)
		endpoint_func.call(request, response)

	return response


func __response_from_status(code: int) -> Response:
	var response: Response = Response.new()
	response.status(code)

	return response
