
require"zmq"

local context = zmq.init(1)

--  Socket al server
local frontend = context:socket(zmq.SUB)
frontend:connect(arg[1] or "tcp://localhost:5556")

local backend = context:socket(zmq.PUB)
backend:bind(arg[2] or "tcp://*:8100")

--socket para controlar los ganadores
local socketGano = context:socket(zmq.REP)
socketGano:bind("tcp://*:6541")

--  se suscribe al server
frontend:setopt(zmq.SUBSCRIBE, "")

local stopProxy = true


while stopProxy do

	
    while true do
        --  Process all parts of the message
		local messageFromClient = socketGano:recv(zmq.NOBLOCK)
		
		if not messageFromClient then
			local message = frontend:recv()
		
			print("PROXY GETS: " .. message )
			if frontend:getopt(zmq.RCVMORE) == 1 then
				backend:send(message, zmq.SNDMORE)
				print("WUPROXY RCVMORE")
			else
				backend:send(message)
				print("PROXY SENDS: " .. message )
				print("WUPROXY")
				break      --  Last message part
			end
		else
			print("ALGUNO GANO: " .. messageFromClient)
			backend:send(messageFromClient)
			stopProxy = false
			break
		end
        
    end
end

frontend:close()
backend:close()
socketGano:close()
context:term()
