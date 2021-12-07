# Constant variables

const StatusCode: Resource = preload("res://addons/http_server/status_code.gd")
const Status: Resource = preload("res://addons/http_server/status.gd")


# Private variables

var __data = "" # variant
var __headers: Dictionary = {
	# key: String, header name
	# value: Variant, header value
}
var __status: StatusCode = Status.new().OK


# Public methods

func data(data) -> void: # data: Variant
	__data = data


func header(name: String, value) -> void: # value: Variant
	__headers[name.to_lower()] = value


func json(data) -> void: # data: Variant
	header("content-type", "application/json")
	__data = data


func status(status: int) -> void:
	__status = Status.new().code_to_status(status)
