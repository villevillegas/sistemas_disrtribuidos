function etapaDeDesarrollo (edad)
	if edad <= 0 then
		return 0
	else
		if edad < 6 then
			return "Infancia"
		elseif edad >= 6 and edad < 12 then
			return "niñez"
		elseif edad >= 12 and edad < 18 then
			return "adolescencia"
		elseif edad >= 18 and edad < 25 then
			return "juventud"
		else 
			return "adultez o vejez"
		end
	end
end
print("Digite la edad: ")
e = io.read("*n")
print("La etapa en la que se encuentra es:")
print(etapaDeDesarrollo(e))
