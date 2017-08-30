require "zmq"


local context = zmq.init(1)

local socket = context:socket(zmq.REP)
socket:connect("tcp://localhost:5555")
--TODO



socket:close()
context:term()
