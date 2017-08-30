require "zmq"
require "zhelpers"

local context = zmq.init(1)

local socket = context:socket(zmq.REP)

socket:bind("tcp://*:5555")

--TODO
while true do 
	--Waiting for another request
	local myNumbers = socket:recv()
	while socket:getopt(zmq.RCVMORE) == 1 do
		myNumbers = myNumbers + socket:recv()
	end
	print("myNumbers: " .. myNumbers)
	--print({2,3,4})
	--local suma = myNumbers[1] + myNumbers[2]

	s_sleep(1000)
	
	socket:send(string.format("%f",myNumbers))
ss
end

socket:close()
context:term()
