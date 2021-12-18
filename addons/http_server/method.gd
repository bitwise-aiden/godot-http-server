# Public Constants

enum {
	GET = 0,
	HEAD,
	POST,
	PUT,
	DELETE,
	CONNECT,
	OPTIONS,
	TRACE,
	PATCH
}


# Private constants

const __DESCRIPTIONS: Dictionary = {
	GET: "Get",
	HEAD: "Head",
	POST: "Post",
	PUT: "Put",
	DELETE: "Delete",
	CONNECT: "Connect",
	OPTIONS: "Options",
	TRACE: "Trace",
	PATCH: "Patch",
}

const __TYPES: Dictionary = {
	"GET": GET,
	"HEAD": HEAD,
	"POST": POST,
	"PUT": PUT,
	"DELETE": DELETE,
	"CONNECT": CONNECT,
	"OPTIONS": OPTIONS,
	"TRACE": TRACE,
	"PATCH": PATCH,
}


# Public methods

static func description_to_type(description: String) -> int:
	return identifier_to_type(description.to_upper())


static func identifier_to_type(identifier: String) -> int:
	if __TYPES.has(identifier):
		return __TYPES[identifier]

	return -1


static func type_to_description(type: int) -> String:
	return __DESCRIPTIONS[type]


static func type_to_identifier(type: int) -> String:
	return type_to_description(type).to_upper()
