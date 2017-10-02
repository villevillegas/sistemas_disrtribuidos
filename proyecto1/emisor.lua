
require"zmq"
require"zhelpers"

--  Prepare our context and publisher
local context = zmq.init(1)
local publisher = context:socket(zmq.PUB)
publisher:bind("tcp://*:5556")




local numerosCantados = {}

function cantarNumerno( from,to )
	-- body
	math.randomseed(os.time())
	number = math.random(from,to)

	if #numerosCantados == 0  then
		numerosCantados[1] = number
	else
		while esNumeroCantado(number)==false do
			--math.randomseed(os.time())
			--print("Entra al ciclo while")
			number = math.random(from,to)
		end
	end
	numerosCantados[#numerosCantados+1] = number
	return number

end

function esNumeroCantado( numero )
	--print("Entra al esNumeroCantado")
	-- body
	for i=1,#numerosCantados do 

		--print(i)
		if numerosCantados[i] == numero then
			--print("Entra al esNumeroCantado")
			return false
		end
	end
	return true
end


--  Se inicializa en generador de numeros random

math.randomseed(os.time())
flagSeguirEnviardo = true
numeroParaEnviar = 0
while #numerosCantados <= 76 and flagSeguirEnviardo do

	if #numerosCantados == 0 then
		--Enviamos un numero no jugable ya que el protocolo 
		--envia un primero numero pero los clientes no lo capturan
		publisher:send(string.format("%d",-1))
		numerosCantados[1] = -1
	else
		numeroParaEnviar = cantarNumerno(1,75)
		publisher:send(string.format("%d", numeroParaEnviar))
		print(#numerosCantados .. " -- SENDING: " .. numeroParaEnviar)
		
	end
	s_sleep(3000)
	
	
	
end
publisher:close()
context:term()
