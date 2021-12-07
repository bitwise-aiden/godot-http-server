# Public variables

var code: int setget , __get_code
var identifier: String setget , __get_identifier
var description: String setget , __get_description
var status_line: String setget , __get_status_line
var payload: String setget , __get_payload


# Lifecycle methods

func _init(code: int, identifier: String, description: String) -> void:
	self.code = code
	self.identifier = identifier
	self.description = description
	status_line = "HTTP/1.1 %d %s" % [code, identifier]
	payload = "%s\r\n\r\n" % status_line


# Private methods

func __get_code() -> int:
	return code


func __get_description() -> String:
	return description


func __get_identifier() -> String:
	return identifier


func __get_payload() -> String:
	return payload


func __get_status_line() -> String:
	return status_line
