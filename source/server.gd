extends Node

var img = preload("res://html/picture.png")
# Private variables

var __server: HTTPServer = null


# Lifecycle methods

func _process(delta: float) -> void:
	if __server == null:
		__start_server()

	__process_connections()


# Private methods

func __start_server(port: int = 3000) -> void:
	print("Starting server")
	__server = HTTPServer.new()

	__server.endpoint(HTTPServer.Method.GET, "/test", __test)
	__server.endpoint(HTTPServer.Method.POST, "/test", __test_post)
	__server.endpoint(HTTPServer.Method.POST, "/webhook", __webhook)

	__server.listen(port)


func __process_connections() -> void:
	if __server == null:
		return # Possibly start the server again here

	__server.__take_connection()


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
