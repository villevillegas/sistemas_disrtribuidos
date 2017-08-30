function encuentra(value,m)
	for i =1, #m do
		if(m[i] == value) then 
			return true 
		end
	end
	return false
end
function interseccion(a,b)
	al = #a
	bl = #b
	i = 1
	j = 1
	
	interseccion = {}
	for i = 1, #a do
		if encuentra(a[i], b) then
			--print(a[i])
			table.insert(interseccion,a[i] )
		end
	end	
	return interseccion
	

end

b1 = {1,3,4,6}
a1 = {2,3,5,7,8,6}
m = interseccion(a1,b1)


for i = 1, #m do

	print(m[i])
	
	end