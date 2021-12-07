class_name HTTPServer extends TCP_Server


# Public constants

const Request = preload("res://addons/http_server/request.gd")
const Response = preload("res://addons/http_server/response.gd")
const Status = preload("res://addons/http_server/status.gd")


# Private variables

var __endpoints: Dictionary = {
	# key: [Int, String], array with 0 index representing method, 1 index representing endpoint
	# value: FuncRef, reference to function to call
}
var __fallback: FuncRef = null
var __server: TCP_Server = null



# Public methods

func endpoint(type: int, endpoint: String, function: FuncRef) -> void:
	var endpoint_hash: Array = [type, endpoint]
	if endpoint_hash in self.__endpoints:
		print(
			"[ERR] Endpoint already defined type: %s, endpoint: %s" % [
				self.__type_string(type),
				endpoint,
			]
		)
		return

	self.__endpoints[endpoint_hash] = function


func fallback(function: FuncRef) -> void:
	self.__fallback = function


func take_connection() -> StreamPeerTCP:
	if self.__server == null || !self.__server.is_listening():
		print(
			"[ERR] Server is not listening, please initialize and listen before calling `take_connection`"
		)
		return

	var connection: StreamPeerTCP = self.__server.take_connection()

	if connection:
		self.__process_connection(connection)

	return connection


# Private methods

func __type_string(type: int) -> String:
	if type < 0 || type > 3:
		return "UNKNOWN (%d)" % type

	return ["GET", "DELETE", "PUT", "POST"][type]

func __type_from_string(type: String) -> int:
	return ["GET", "DELETE", "PUT", "POST"].find(type)


func __process_connection(connection: StreamPeerTCP) -> void:
	var content: PoolByteArray = PoolByteArray([])

	while true:
		var bytes = connection.get_available_bytes()
		if bytes == 0:
			break

		var data = connection.get_partial_data(bytes)
		content.append_array(data[1])

	if content.empty():
		return

	var content_string: String = content.get_string_from_utf8()
	var content_parts: Array = content_string.split("\r\n")

	if content_parts.empty():
		connection.put_data(Status.code_to_response(Status.BAD_REQUEST).to_utf8())
		return

	var request_line = content_parts[0]
	var request_line_parts = request_line.split(" ")

	var method: String = request_line_parts[0]
	var endpoint: String = request_line_parts[1]

	var headers: Dictionary = {}
	var header_index: int = content_parts.find("")

	if header_index == -1:
		print(
			"[ERR] Error parsing request data: %s" % [String(content)]
		)
		connection.put_data(Status.code_to_response(Status.BAD_REQUEST).to_utf8())
		return

	for i in range(1, header_index):
		var header_parts: Array = content_parts[i].split(":", true, 1)
		var header = header_parts[0].strip_edges().to_lower()
		var value = header_parts[1].strip_edges()

		headers[header] = value

	var body: String = ""
	if header_index != content_parts.size() - 1:
		var body_parts: Array = content_parts.slice(header_index + 1, content_parts.size())
		body = PoolStringArray(body_parts).join("\r\n")

	var result: String = self.__process_request(method, endpoint, headers, body)
	connection.put_data(result.to_utf8())


func __process_request(method: String, endpoint: String, headers: Dictionary, body: String) -> String:
	var type: int = self.__type_from_string(method)

	var request: Request = Request.new(
		type,
		endpoint,
		headers,
		body
	)

	var endpoint_func: FuncRef = null
	var endpoint_hash: Array = [type, endpoint]
	if !self.__endpoints.has(endpoint_hash):
		print(
			"[WRN] Recieved request for unknown endpoint, method: %s, endpoint: %s" % [method, endpoint]
		)
		if self.__fallback:
			endpoint_func = self.__fallback
		else:
			return Status.code_to_response(Status.NOT_FOUND)
	else:
		endpoint_func = self.__endpoints[endpoint_hash]

	if !endpoint_func.is_valid():
		print(
			"[ERR] FuncRef for endpoint not valid, method: %s, endpoint: %s" % [method, endpoint]
		)

	print(
		"[INF] Recieved request method: %s, endpoint: %s" % [method, endpoint]
	)

	var response: Response = Response.new()
	endpoint_func.call_func(request, response)

	return self.__process_response(response)


func __process_response(response: Response) -> String:
	var content = PoolStringArray()

	content.append(Status.code_to_status_line(response.__status))

	var data = response.__data
	if response.__headers.get("content-type", "") == "application/json":
		data = JSON.print(data)

	response.__headers['content-length'] = len(data)

	for header in response.__headers:
		content.append("%s: %s" % [header, String(response.__headers[header])])

	content.append("")

	if data:
		content.append(data)

	return content.join("\r\n")
