
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

print("Para TRASPONER")
r1 = {1,2,3}
r2 = {4,5,6}
r3 = {7,8,9}

m1 = {r1,r2,r3,r4}
for i = 1, #m1 do
	print("\n")
	for j =	1, #m1[i] do
		print(m1[i][j])
	end
end


print("LA TRASPUESTA")
mt2 = traspuesta(m1)
for i = 1, #mt2 do
	print("\n")
	for j =	1, #mt2[i] do
		print(mt2[i][j])
	end
end

