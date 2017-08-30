function salario (horas, precioxhora)
	if horas<= 0 or precioxhora <= 0 then
		return 0
	else
		salarioBruto = horas * precioxhora
		descuento = salarioBruto* 0.20
		salarioNeto = salarioBruto - descuento
	
		return salarioNeto
	end
end
print("horas Trabajadas:")
a = io.read("*n") -- reads a number
print("precio x hora:")
b = io.read("*n")

 
h =  salario(a,b)
if h == 0 then
print("Error")
else
print("Salario Neto")
print(h)
end