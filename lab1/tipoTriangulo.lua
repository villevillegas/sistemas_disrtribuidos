function tipoTriangulo (l1,l2,l3)
	if l1 == l2 and l1 == l3 then
		return "Equilatero"
		
	elseif (l1 == l2 and l1 ~= l3 and l2 ~= l3) or (l1== l3 and l1 ~= l2 and l3 ~= l2) or (l2 == l3 and l2 ~= l1 and l3 ~= l1) then
		return "Isoceles" 

	else
		return "Escaleno"
	end
end

print("Digite lado 1")
x1 = io.read("*n")
print("Digite lado 2")
x2 = io.read("*n")
print("Digite lado 3")
x3 = io.read("*n")

print("El tipo de triangulo es: ")
print(tipoTriangulo(x1,x2,x3))