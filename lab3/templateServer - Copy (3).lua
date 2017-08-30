require "zmq"
require "zhelpers"

local context = zmq.init(1)

local socket = context:socket(zmq.REP)

socket:bind("tcp://*:5555")

--TODO


socket:close()
context:term()
