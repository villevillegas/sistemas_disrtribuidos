require "zmq"


local context = zmq.init(1)
print("Conectando al servidor")
local socket = context:socket(zmq.REQ)
socket:connect("tcp://localhost:5555")

print("Que hora es?")
socket:send("Que hora es?")
local reply = socket:recv()
print(reply)



socket:close()
context:term()