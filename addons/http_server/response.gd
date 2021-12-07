# Private variables

var __data = "" # variant
var __headers: Dictionary = {
	# key: String, header name
	# value: Variant, header value
}
var __status: int = 200


# Public methods

func data(data) -> void: # data: Variant
	__data = data


func header(name: String, value) -> void: # value: Variant
	__headers[name.to_lower()] = value


func json(data) -> void: # data: Variant
	header("content-type", "application/json")
	__data = data


func status(status: int) -> void:
	__status = status
