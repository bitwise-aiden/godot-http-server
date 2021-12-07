# Public constants

const CONTINUE: int = 100
const SWITCHING_PROTOCOLS: int = 101
const PROCESSING: int = 102
const EARLY_HINTS: int = 103
const OK: int = 200
const CREATED: int = 201
const ACCEPTED: int = 202
const NON_AUTHORITATIVE_INFORMATION: int = 203
const NO_CONTENT: int = 204
const RESET_CONTENT: int = 205
const PARTIAL_CONTENT: int = 206
const MULTI_STATUS: int = 207
const ALREADY_REPORTED: int = 208
const IM_USED: int = 226
const MULTIPLE_CHOICE: int = 300
const MOVED_PERMANENTLY: int = 301
const FOUND: int = 302
const SEE_OTHER: int = 303
const NOT_MODIFIED: int = 304
const TEMPORARY_REDIRECT: int = 307
const PERMANENT_REDIRECT: int = 308
const BAD_REQUEST: int = 400
const UNAUTHORIZED: int = 401
const PAYMENT_REQUIRED: int = 402
const FORBIDDEN: int = 403
const NOT_FOUND: int = 404
const METHOD_NOT_ALLOWED: int = 405
const NOT_ACCEPTABLE: int = 406
const PROXY_AUTHENTICATION_REQUIRED: int = 407
const REQUEST_TIMEOUT: int = 408
const CONFLICT: int = 409
const GONE: int = 410
const LENGTH_REQUIRED: int = 411
const PRECONDITION_FAILED: int = 412
const PAYLOAD_TOO_LARGE: int = 413
const URI_TOO_LONG: int = 414
const UNSUPPORTED_MEDIA_TYPE: int = 415
const RANGE_NOT_SATISFIABLE: int = 416
const EXPECTATION_FAILED: int = 417
const IM_A_TEAPOT: int = 418
const MISDIRECTED_REQUEST: int = 421
const UNPROCESSABLE_ENTITY: int = 422
const LOCKED: int = 423
const FAILED_DEPENDENCY: int = 424
const TOO_EARLY: int = 425
const UPGRADE_REQUIRED: int = 426
const PRECONDITION_REQUIRED: int = 428
const TOO_MANY_REQUESTS: int = 429
const REQUEST_HEADER_FIELDS_TOO_LARGE: int = 431
const UNAVAILABLE_FOR_LEGAL_REASONS: int = 451
const INTERNAL_SERVER_ERROR: int = 500
const NOT_IMPLEMENTED: int = 501
const BAD_GATEWAY: int = 502
const SERVICE_UNAVAILABLE: int = 503
const GATEWAY_TIMEOUT: int = 504
const HTTP_VERSION_NOT_SUPPORTED: int = 505
const VARIANT_ALSO_NEGOTIATES: int = 506
const INSUFFICIENT_STORAGE: int = 507
const LOOP_DETECTED: int = 508
const NOT_EXTENDED: int = 510
const NETWORK_AUTHENTICATION_REQUIRED: int = 511


# Private constants

const __DESCRIPTIONS: Dictionary = {
	100: "Continue",
	101: "Switching Protocols",
	102: "Processing",
	103: "Early Hints",
	200: "Ok",
	201: "Created",
	202: "Accepted",
	203: "Non-Authoritative Information",
	204: "No Content",
	205: "Reset Content",
	206: "Partial Content",
	207: "Multi-Status",
	208: "Already Reported",
	226: "IM Used",
	300: "Multiple Choice",
	301: "Moved Permanently",
	302: "Found",
	303: "See Other",
	304: "Not Modified",
	307: "Temporary Redirect",
	308: "Permanent Redirect",
	400: "Bad Request",
	401: "Unauthorized",
	402: "Payment Required",
	403: "Forbidden",
	404: "Not Found",
	405: "Method Not Allowed",
	406: "Not Acceptable",
	407: "Proxy Authentication Requested",
	408: "Request Timeout",
	409: "Conflict",
	410: "Gone",
	411: "Length Required",
	412: "Precondition Failed",
	413: "Payload Too Large",
	414: "URI Too long",
	415: "Unsupported Media Type",
	416: "Range Not Satisfiable",
	417: "Expectation Failed",
	418: "I'm A Teapot",
	421: "Misdirected Request",
	422: "Unprocessable Entity",
	423: "Locked",
	424: "Failed Dependency",
	425: "Too Early",
	426: "Upgrade Required",
	428: "Precondition Required",
	429: "Too Many Requests",
	431: "Request Header Fields Too Large",
	451: "Unavailable For Legal Reasons",
	500: "Internal Server Error",
	501: "Not Implemented",
	502: "Bad Gateway",
	503: "Service Unavailable",
	504: "Gateway Timeout",
	505: "HTTP Version Not Supported",
	506: "Variant Also Negotiates",
	507: "Insufficient Storage",
	508: "Loop detected",
	510: "Not Extended",
	511: "Network Authentication Required",
}

const __IDENTIFIERS: Dictionary = {
	100: "CONTINUE",
	101: "SWITCHING_PROTOCOLS",
	102: "PROCESSING",
	103: "EARLY_HINTS",
	200: "OK",
	201: "CREATED",
	202: "ACCEPTED",
	203: "NON_AUTHORITATIVE_INFORMATION",
	204: "NO_CONTENT",
	205: "RESET_CONTENT",
	206: "PARTIAL_CONTENT",
	207: "MULTI_STATUS",
	208: "ALREADY_REPORTED",
	226: "IM_USED",
	300: "MULTIPLE_CHOICE",
	301: "MOVED_PERMANENTLY",
	302: "FOUND",
	303: "SEE_OTHER",
	304: "NOT_MODIFIED",
	307: "TEMPORARY_REDIRECT",
	308: "PERMANENT_REDIRECT",
	400: "BAD_REQUEST",
	401: "UNAUTHORIZED",
	402: "PAYMENT_REQUIRED",
	403: "FORBIDDEN",
	404: "NOT_FOUND",
	405: "METHOD_NOT_ALLOWED",
	406: "NOT_ACCEPTABLE",
	407: "PROXY_AUTHENTICATION_REQUIRED",
	408: "REQUEST_TIMEOUT",
	409: "CONFLICT",
	410: "GONE",
	411: "LENGTH_REQUIRED",
	412: "PRECONDITION_FAILED",
	413: "PAYLOAD_TOO_LARGE",
	414: "URI_TOO_LONG",
	415: "UNSUPPORTED_MEDIA_TYPE",
	416: "RANGE_NOT_SATISFIABLE",
	417: "EXPECTATION_FAILED",
	418: "IM_A_TEAPOT",
	421: "MISDIRECTED_REQUEST",
	422: "UNPROCESSABLE_ENTITY",
	423: "LOCKED",
	424: "FAILED_DEPENDENCY",
	425: "TOO_EARLY",
	426: "UPGRADE_REQUIRED",
	428: "PRECONDITION_REQUIRED",
	429: "TOO_MANY_REQUESTS",
	431: "REQUEST_HEADER_FIELDS_TOO_LARGE",
	451: "UNAVAILABLE_FOR_LEGAL_REASONS",
	500: "INTERNAL_SERVER_ERROR",
	501: "NOT_IMPLEMENTED",
	502: "BAD_GATEWAY",
	503: "SERVICE_UNAVAILABLE",
	504: "GATEWAY_TIMEOUT",
	505: "HTTP_VERSION_NOT_SUPPORTED",
	506: "VARIANT_ALSO_NEGOTIATES",
	507: "INSUFFICIENT_STORAGE",
	508: "LOOP_DETECTED",
	510: "NOT_EXTENDED",
	511: "NETWORK_AUTHENTICATION_REQUIRED",
}


# Public methods

static func code_to_description(code: int) -> String:
	return __DESCRIPTIONS[code]


static func code_to_identifier(code: int) -> String:
	return __IDENTIFIERS[code]


static func code_to_response(code: int) -> String:
	return "%s\n\n" % code_to_status_line(code)


static func code_to_status_line(code: int) -> String:
	return "HTTP/1.1 %d %s" % [code, code_to_identifier(code)]
