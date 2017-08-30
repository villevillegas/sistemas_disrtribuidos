function hipotenusa (a1,b1)
	if a1 == 0 or b1== 0 then
		return 0
	else
		a2 = a1^2
		b2 = b1^2
		c2 = a2 + b2
		c = math.sqrt(c2)
		return c
	end
end

print("cateto a:")
a = io.read("*n") -- reads a number
print("cateto b:")
b = io.read("*n")

 
 h =  hipotenusa(a,b)
if h == 0 then
print("Error")
else
print("Hipotenusa")
print(h)
end