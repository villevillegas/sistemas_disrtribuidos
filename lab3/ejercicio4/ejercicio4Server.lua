require"zmq"
require"zhelpers"


local context = zmq.init(1)


local client1 = context:socket(zmq.REP)
client1:bind("tcp://*:5557")

--  Connect to weather server
local client2 = context:socket(zmq.REP)
client2:bind("tcp://*:5556")

while true do
    --  Process any waiting tasks
    local msg
    --Espera respuestas del cliente 1 si no la encuentra continua
    while true do
    	--
        msg = client1:recv(zmq.NOBLOCK)

        if not msg then break end
        client2:send(msg)
        --  process task
    end
    --Espera respuestas del cliente 2 si no la encuentra continua
    while true do
        msg = client2:recv(zmq.NOBLOCK)
       	
        if not msg then break end
        client1:send(msg)
        --  process weather update
    end
    --  No activity, so sleep for 1 msec
    s_sleep (200)
end
--  We never get here but clean up anyhow
client1:close()
client2:close()
context:term()