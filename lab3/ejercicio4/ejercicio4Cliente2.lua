require "zmq"


local context = zmq.init(1)

local socket = context:socket(zmq.REQ)
socket:connect("tcp://localhost:5556")



--TODO
while true do
	print("Escriba mensaje y presione la tecla enter")
	local message = io.read();
	socket:send(message)
	print("Esperando respuesta de cliente 1")
	local respuesta = socket:recv()
	print("Cliente 1 dice: " .. respuesta)
end


socket:close()
context:term()
