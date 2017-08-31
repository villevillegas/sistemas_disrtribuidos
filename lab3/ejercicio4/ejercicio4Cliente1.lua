require "zmq"


local context = zmq.init(1)

local socket = context:socket(zmq.REQ)
socket:connect("tcp://localhost:5557")
--TODO
--TODO
while true do
	print("Escriba mensaje y presione la tecla enter")
	local message = io.read();
	socket:send(message)
	print("Esperando respuesta de cliente 2")
	local respuesta = socket:recv()
	print("Cliente 2 dice: " .. respuesta)
	
end


socket:close()
context:term()
