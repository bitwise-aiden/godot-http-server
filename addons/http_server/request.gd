
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

func _init(type: int,endpoint: String,headers: Dictionary,body: String):
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
			"[WRN] Attempting to call get_json checked a request with content-type: %s" % [content_type]
		)
		return null

	var json = JSON.new()
	var test_json_conv = json.parse(__body)
	if test_json_conv != OK:
		print(
			"[ERR] Error parsing request json at line %s: %s" % [json.get_error_line(), json.get_error_message()]
		)

	__json_data = json.get_data()

	return __json_data


func type() -> int:
	return __type
