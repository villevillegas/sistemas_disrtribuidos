function simetrica(m)
	for i=1,3 do
		--print("\n")
		 for j=1,3 do
			--print(m[i][j] .. " - " .. m[j][i])
			if m[i][j] ~= m[j][i] then
				return false
				
			end
		end
	end
	return true
end


--Matriz Simetrica
r1 = {0,1,2}
r2 = {1,5,8}
r3 = {2,8,9}
m1 = {r1,r2,r3}

print("Probando la simetrica")
print(simetrica(m1))


--Matriz No Simetrica
r1 = {0,1,9}
r2 = {1,5,8}
r3 = {2,8,9}
m1 = {r1,r2,r3}
print("Probando la NO simetrica")
print(simetrica(m1))

