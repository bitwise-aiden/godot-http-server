# Public Constants

const Status = preload("res://addons/http_server/status.gd")


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


func to_utf8() -> PoolByteArray:
	var content = PoolStringArray()

	content.append(Status.code_to_status_line(__status))

	var data = __data
	if !data:
		data = Status.code_to_description(__status)

	if __headers.get("content-type", "") == "application/json":
		data = JSON.print(data)

	__headers['content-length'] = len(data)

	for header in __headers:
		content.append("%s: %s" % [header, String(__headers[header])])

	content.append("")

	if data:
		content.append(data)

	return content.join("\r\n").to_utf8()
