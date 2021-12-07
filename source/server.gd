extends Node


# Private variables

var __server: HTTPServer = null


# Lifecycle methods

func _process(delta: float) -> void:
	if __server == null:
		__start_server()

	self.__process_connections()


# Private methods

func __start_server(port: int = 3000) -> void:
	print("Starting server")
	self.__server = HTTPServer.new()

	self.__server.endpoint(HTTPServer.Request.GET, "/test", funcref(self, "__test"))
	self.__server.endpoint(HTTPServer.Request.POST, "/test", funcref(self, "__test_post"))
	self.__server.endpoint(HTTPServer.Request.GET, "/webhook", funcref(self, "__webhook"))
	self.__server.fallback(funcref(self, "__fallback"))

	self.__server.listen(port)


func __process_connections() -> void:
	if self.__server == null:
		return # Possibly start the server again here

	self.__server.take_connection()


func __test(request: HTTPServer.Request, response: HTTPServer.Response) -> void:
	response.json({
		"key": "value",
		"hello": "world",
		"asdf": 1234
	})


func __test_post(request: HTTPServer.Request, response: HTTPServer.Response) -> void:
	var json: Dictionary = request.json()
	response.data("Hello %s" % json["name"])


func __webhook(request: HTTPServer.Request, response: HTTPServer.Response) -> void:
	response.status(201)


func __fallback(request: HTTPServer.Request, response: HTTPServer.Response) -> void:
	response.status(400)
	response.data("Unknown endpoint %s" % [request.endpoint()])
