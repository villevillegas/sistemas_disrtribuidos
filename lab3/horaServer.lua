require "zmq"
require "zhelpers"

local context = zmq.init(1)

local socket = context:socket(zmq.REP)

socket:bind("tcp://*:5555")

while true do 
	--Waiting for another request
	local request = socket:recv()
	print("La pregunta: " .. request)
	s_sleep(1000)
	
	socket:send(os.date("Son las: %X"))

end
socket:close()
context:term()

--Other parts of the libzmq API became more consistent. We deprecated zmq_init() and
--zmq_term(), replacing them with zmq_ctx_new() and zmq_ctx_destroy(). We added
--szmq_ctx_set() to let you configure a context before starting to work with it.