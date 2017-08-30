function distanciaEntrePuntos (x1,y1,x2,y2)

		return  math.sqrt(((x2-x1)^2)+((y2-y1)^2))
		
end
print("Digite x1")
x11 = io.read("*n")
print("Digite y1")
y11 = io.read("*n")
print("Digite x2")
x22 = io.read("*n")
print("Digite y2")
y22 = io.read("*n")

distancia = distanciaEntrePuntos(x11,y11,x22,y22)

print("La distancia es: ")
print(distancia)