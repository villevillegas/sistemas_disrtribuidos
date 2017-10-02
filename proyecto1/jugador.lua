
--
require"zmq"

local context = zmq.init(1)

--  Socket para hablar con emisor

local subscriber = context:socket(zmq.SUB)
subscriber:connect(arg[2] or "tcp://localhost:8100")

--Socket para controlar si gane
local socketGane = context:socket(zmq.REQ)
socketGane:connect("tcp://localhost:6541")


local filter = arg[1] or ""
subscriber:setopt(zmq.SUBSCRIBE, filter)






function generate_board()
	column1 = generateColumn(1,15)
	column2 = generateColumn(16,30)
	column3 = generateColumn(31,45)
	column4 = generateColumn(46,60)
	column5 = generateColumn(61,75)
	--seteamos el centro
	column3[3]=0
	board = {column1,column2,column3,column4,column5}
	--Debemos sacar la traspuesta ya que si lo dejamos asi
	--las columnas serian filas

	transposeBoard = traspuesta(board)
	return transposeBoard

end

function validateColumn( number, column )
	-- Validates that the column donsn't contain repeated numbers/.
	for i=1,#column do
		--if column[i] ~= nil then

			if column[i] == number then
				return false
			end
		--end
	end
	return true
end

function generateColumn( from, to )

	-- body
	column={}
	number = 0
	for i=1,5 do
		validatorFlag = false
		if i == 1 then
			math.randomseed(os.time())
			column[i] = math.random(from,to)
		else
			while validatorFlag == false do
				math.randomseed(os.time())
				number = math.random(from,to)
				validatorFlag = validateColumn(number,column)
			end
			column[i] = number
		end
	end
	return column
end

function traspuesta(m)

	mTranspuesta = {}          -- create the matrix
    for i=1, #m[1] do
		mTranspuesta[i] = {}     -- create a new row
		for j=1,#m do
			mTranspuesta[i][j] = m[j][i]
		end
    end
	return mTranspuesta
	
end

function imprimeTablero()
	for i = 1, #miCarton do
		print("\n")
		for j =	1, #miCarton[i] do
			
			io.write(miCarton[i][j],"   ")
			--print(miCarton[i][j])
		end
	end	
end
--Recibe un numero para verificar su existencia en el carton
--Lo marca(Pone 0) si el numero existe
function marcarCarton(number)
	for i = 1, #miCarton do
		
		for j =	1, #miCarton[i] do
			
			if miCarton[i][j] == number then
				miCarton[i][j] = 0
			end
			
			--print(miCarton[i][j])
		end
	end	
end

function cartonLleno()
	local contador = 0
	for i = 1, #miCarton do
		
		for j =	1, #miCarton[i] do
			
			if miCarton[i][j] == 0 then
				contador = contador+1
			end
			
			--print(miCarton[i][j])
		end
	end
	if contador == 25 then
		return true
	else
		return false
	end
end
print("GENERANDO CARTON")
miCarton = generate_board()
imprimeTablero()

print("ESPERANDO NUMERO...")


local keepPlaying = true
while keepPlaying do
	local message = subscriber:recv()
	
	if tonumber(message) == 100 then
	--Verificamos si hay ganador
		print("OTRO CARTON GANO")
		print("*-*-*-*-*-*-*-*-*JUEGO TERMINADO*-*-*-*-*-*-*-*-*")
		break
	else
		print("")
		print("El NUMERO EN JUEGO ES: " .. message)
		-- Aqui Marcamos
		marcarCarton(tonumber(message))
		-- IMRIME CARTON
		imprimeTablero()
		--Validamos CARTON
		
		if cartonLleno() then
			print("BINGO")
			
			keepPlaying = false
			socketGane:send(string.format(100))
		else
			keepPlaying =true
			
		end
		print("")
		print("")
		print("")
	end
	
	
end




socketGane:close()
subscriber:close()
context:term()
