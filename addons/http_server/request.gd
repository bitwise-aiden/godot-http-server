
# Public constants

const Method = preload("res://addons/http_server/method.gd")

# Private variables

var __body: String = ""
var __endpoint: String = ""
var __headers: Dictionary = {
	# key: String, header name
	# value: Variant, header value
}
var __json_data = null # Variant
var __type: int = Method.GET


# Lifecyle methods

func _init(type: int, endpoint: String, headers: Dictionary, body: String) -> void:
	__body = body
	__endpoint = endpoint
	__headers = headers
	__type = type


# Public methods

func body() -> String:
	return __body


func endpoint() -> String:
	return __endpoint


func header(name: String = "", default = null): # Variant
	return __headers.get(name, default)


func headers() -> Dictionary:
	return __headers


func json(): # Variant
	if __json_data != null:
		return __json_data

	var content_type = header("content-type")
	if  content_type != "application/json":
		print(
			"[WRN] Attempting to call get_json on a request with content-type: %s" % [content_type]
		)
		return null

	var result = JSON.parse(__body)
	if result.error:
		print(
			"[ERR] Error parsing request json: %s" % [result.error_string]
		)

	__json_data = result.result

	return __json_data


func type() -> int:
	return __type
