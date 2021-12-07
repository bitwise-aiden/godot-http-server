const StatusCode = preload("res://addons/http_server/status_code.gd")


# Constant variables

var CONTINUE: StatusCode = StatusCode.new(100, "CONTINUE", "Continue")
var SWITCHING_PROTOCOLS: StatusCode = StatusCode.new(101, "SWITCHING_PROTOCOLS", "Switching Protocols")
var PROCESSING: StatusCode = StatusCode.new(100, "PROCESSING", "Processing")
var EARLY_HINTS: StatusCode = StatusCode.new(103, "EARLY_HINTS", "Early Hints")

var OK: StatusCode = StatusCode.new(200, "OK", "Ok")
var CREATED: StatusCode = StatusCode.new(201, "CREATED", "Created")
var ACCEPTED: StatusCode = StatusCode.new(202, "ACCEPTED", "Accepted")
var NON_AUTHORITATIVE_INFORMATION: StatusCode = StatusCode.new(203, "NON_AUTHORITATIVE_INFORMATION", "Non-Authoritative Information")
var NO_CONTENT: StatusCode = StatusCode.new(204, "NO_CONTENT", "No Content")
var RESET_CONTENT: StatusCode = StatusCode.new(205, "RESET_CONTENT", "Reset Content")
var PARTIAL_CONTENT: StatusCode = StatusCode.new(206, "PARTIAL_CONTENT", "Partial Content")
var MULTI_STATUS: StatusCode = StatusCode.new(207, "MULTI_STATUS", "Multi-Status")
var ALREADY_REPORTED: StatusCode = StatusCode.new(208, "ALREADY_REPORTED", "Already Reported")
var IM_USED: StatusCode = StatusCode.new(226, "IM_USED", "IM Used")

var MULTIPLE_CHOICE: StatusCode = StatusCode.new(300, "MULTIPLE_CHOICE", "Multiple Choice")
var MOVED_PERMANENTLY: StatusCode = StatusCode.new(301, "MOVED_PERMANENTLY", "Moved Permanently")
var FOUND: StatusCode = StatusCode.new(302, "FOUND", "Found")
var SEE_OTHER: StatusCode = StatusCode.new(303, "SEE_OTHER", "See Other")
var NOT_MODIFIED: StatusCode = StatusCode.new(304, "NOT_MODIFIED", "Not Modified")
var TEMPORARY_REDIRECT: StatusCode = StatusCode.new(307, "TEMPORARY_REDIRECT", "Temporary Redirect")
var PERMANENT_REDIRECT: StatusCode = StatusCode.new(308, "PERMANENT_REDIRECT", "Permanent Redirect")

var BAD_REQUEST: StatusCode = StatusCode.new(400, "BAD_REQUEST", "Bad Request")
var UNAUTHORIZED: StatusCode = StatusCode.new(401, "UNAUTHORIZED", "Unauthorized")
var PAYMENT_REQUIRED: StatusCode = StatusCode.new(402, "PAYMENT_REQUIRED", "Payment Required")
var FORBIDDEN: StatusCode = StatusCode.new(403, "FORBIDDEN", "Forbidden")
var NOT_FOUND: StatusCode = StatusCode.new(404, "NOT_FOUND", "Not Found")
var METHOD_NOT_ALLOWED: StatusCode = StatusCode.new(405, "METHOD_NOT_ALLOWED", "Method Not Allowed")
var NOT_ACCEPTABLE: StatusCode = StatusCode.new(406, "NOT_ACCEPTABLE", "Not Acceptable")
var PROXY_AUTHENTICATION_REQUIRED: StatusCode = StatusCode.new(407, "PROXY_AUTHENTICATION_REQUIRED", "Proxy Authentication Requested")
var REQUEST_TIMEOUT: StatusCode = StatusCode.new(408, "REQUEST_TIMEOUT", "Request Timeout")
var CONFLICT: StatusCode = StatusCode.new(409, "CONFLICT", "Conflict")
var GONE: StatusCode = StatusCode.new(410, "GONE", "Gone")
var LENGTH_REQUIRED: StatusCode = StatusCode.new(411, "LENGTH_REQUIRED", "Length Required")
var PRECONDITION_FAILED: StatusCode = StatusCode.new(412, "PRECONDITION_FAILED", "Precondition Failed")
var PAYLOAD_TOO_LARGE: StatusCode = StatusCode.new(413, "PAYLOAD_TOO_LARGE", "Payload Too Large")
var URI_TOO_LONG: StatusCode = StatusCode.new(414, "URI_TOO_LONG", "URI Too long")
var UNSUPPORTED_MEDIA_TYPE: StatusCode = StatusCode.new(415, "UNSUPPORTED_MEDIA_TYPE", "Unsupported Media Type")
var RANGE_NOT_SATISFIABLE: StatusCode = StatusCode.new(416, "RANGE_NOT_SATISFIABLE", "Range Not Satisfiable")
var EXPECTATION_FAILED: StatusCode = StatusCode.new(417, "EXPECTATION_FAILED", "Expectation Failed")
var IM_A_TEAPOT: StatusCode = StatusCode.new(418, "IM_A_TEAPOT", "I'm A Teapot")
var MISDIRECTED_REQUEST: StatusCode = StatusCode.new(421, "MISDIRECTED_REQUEST", "Misdirected Request")
var UNPROCESSABLE_ENTITY: StatusCode = StatusCode.new(422, "UNPROCESSABLE_ENTITY", "Unprocessable Entity")
var LOCKED: StatusCode = StatusCode.new(423, "LOCKED", "Locked")
var FAILED_DEPENDENCY: StatusCode = StatusCode.new(424, "FAILED_DEPENDENCY", "Failed Dependency")
var TOO_EARLY: StatusCode = StatusCode.new(425, "TOO_EARLY", "Too Early")
var UPGRADE_REQUIRED: StatusCode = StatusCode.new(426, "UPGRADE_REQUIRED", "Upgrade Required")
var PRECONDITION_REQUIRED: StatusCode = StatusCode.new(428, "PRECONDITION_REQUIRED", "Precondition Required")
var TOO_MANY_REQUESTS: StatusCode = StatusCode.new(429, "TOO_MANY_REQUESTS", "Too Many Requests")
var REQUEST_HEADER_FIELDS_TOO_LARGE: StatusCode = StatusCode.new(431, "REQUEST_HEADER_FIELDS_TOO_LARGE", "Request Header Fields Too Large")
var UNAVAILABLE_FOR_LEGAL_REASONS: StatusCode = StatusCode.new(451, "UNAVAILABLE_FOR_LEGAL_REASONS", "Unavailable For Legal Reasons")

var INTERNAL_SERVER_ERROR: StatusCode = StatusCode.new(500, "INTERNAL_SERVER_ERROR", "Internal Server Error")
var NOT_IMPLEMENTED: StatusCode = StatusCode.new(501, "NOT_IMPLEMENTED", "Not Implemented")
var BAD_GATEWAY: StatusCode = StatusCode.new(502, "BAD_GATEWAY", "Bad Gateway")
var SERVICE_UNAVAILABLE: StatusCode = StatusCode.new(503, "SERVICE_UNAVAILABLE", "Service Unavailable")
var GATEWAY_TIMEOUT: StatusCode = StatusCode.new(504, "GATEWAY_TIMEOUT", "Gateway Timeout")
var HTTP_VERSION_NOT_SUPPORTED: StatusCode = StatusCode.new(505, "HTTP_VERSION_NOT_SUPPORTED", "HTTP Version Not Supported")
var VARIANT_ALSO_NEGOTIATES: StatusCode = StatusCode.new(506, "VARIANT_ALSO_NEGOTIATES", "Variant Also Negotiates")
var INSUFFICIENT_STORAGE: StatusCode = StatusCode.new(507, "INSUFFICIENT_STORAGE", "Insufficient Storage")
var LOOP_DETECTED: StatusCode = StatusCode.new(508, "LOOP_DETECTED", "Loop detected")
var NOT_EXTENDED: StatusCode = StatusCode.new(510, "NOT_EXTENDED", "Not Extended")
var NETWORK_AUTHENTICATION_REQUIRED: StatusCode = StatusCode.new(511, "NETWORK_AUTHENTICATION_REQUIRED", "Network Authentication Required")

var ALL_STATUSES: Array = [
	CONTINUE,
	SWITCHING_PROTOCOLS,
	PROCESSING,
	EARLY_HINTS,

	OK,
	CREATED,
	ACCEPTED,
	NON_AUTHORITATIVE_INFORMATION,
	NO_CONTENT,
	RESET_CONTENT,
	PARTIAL_CONTENT,
	MULTI_STATUS,
	ALREADY_REPORTED,
	IM_USED,

	MULTIPLE_CHOICE,
	MOVED_PERMANENTLY,
	FOUND,
	SEE_OTHER,
	NOT_MODIFIED,
	TEMPORARY_REDIRECT,
	PERMANENT_REDIRECT,

	BAD_REQUEST,
	UNAUTHORIZED,
	PAYMENT_REQUIRED,
	FORBIDDEN,
	NOT_FOUND,
	METHOD_NOT_ALLOWED,
	NOT_ACCEPTABLE,
	PROXY_AUTHENTICATION_REQUIRED,
	REQUEST_TIMEOUT,
	CONFLICT,
	GONE,
	LENGTH_REQUIRED,
	PRECONDITION_FAILED,
	PAYLOAD_TOO_LARGE,
	URI_TOO_LONG,
	UNSUPPORTED_MEDIA_TYPE,
	RANGE_NOT_SATISFIABLE,
	EXPECTATION_FAILED,
	IM_A_TEAPOT,
	MISDIRECTED_REQUEST,
	UNPROCESSABLE_ENTITY,
	LOCKED,
	FAILED_DEPENDENCY,
	TOO_EARLY,
	UPGRADE_REQUIRED,
	PRECONDITION_REQUIRED,
	TOO_MANY_REQUESTS,
	REQUEST_HEADER_FIELDS_TOO_LARGE,
	UNAVAILABLE_FOR_LEGAL_REASONS,

	INTERNAL_SERVER_ERROR,
	NOT_IMPLEMENTED,
	BAD_GATEWAY,
	SERVICE_UNAVAILABLE,
	GATEWAY_TIMEOUT,
	HTTP_VERSION_NOT_SUPPORTED,
	VARIANT_ALSO_NEGOTIATES,
	INSUFFICIENT_STORAGE,
	LOOP_DETECTED,
	NOT_EXTENDED,
	NETWORK_AUTHENTICATION_REQUIRED,
]


# Private variables

var __statuses_by_code: Dictionary = {
	# key: int, status code
	# value: StatusCode, instance
}


# Lifecycle methods

func _init() -> void:
	for status in ALL_STATUSES:
		__statuses_by_code[status.code] = status


# Public methods

func code_to_status(code: int) -> StatusCode:
	return __statuses_by_code[code]
