require "zmq"


local context = zmq.init(1)

local socket = context:socket(zmq.REQ)
socket:connect("tcp://localhost:5555")
--TODO
print("Digite el numero a sumar")
local numero1 = io.read("*n")
print("Digite el numero a sumar")
local numero2 = io.read("*n")
local myNumbers = {numero1,numero2}

--socket:send(string.format("%f, %f",numero1,numero2))
socket:send(string.format("%f",numero1),zmq.SNDMORE)
socket:send(string.format("%f",numero2))
local reply = socket:recv()

print("La suma de los numeros es: " .. reply)

--print(numero1+numero2)


socket:close()
context:term()
