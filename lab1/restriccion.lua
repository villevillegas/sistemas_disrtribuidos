function restriccion (placa)
	


		p = tostring(placa):sub(-1)
		if p == "0" or p == "9" then
		
			return "Viernes"
			
		elseif p == "1" or p == "2" then
			return "Lunes"
		elseif p == "3" or p == "4" then
			return "Martes"
		elseif p == "5" or p == "6" then
			return "Miercoles"
		else
			return "Jueves"
		end 
end
print("Digite la placa: ")
laPlaca = io.read()
print("El dia de restriccion es: ")
print(restriccion(laPlaca))
