def transformar_a_arreglo dict

	arrResult = []

	dict.each do |key, array|
		arrResult << array.values
	end

	for i in 0..arrResult.size - 1
		for j in 0..arrResult[i].size - 1
			if arrResult[i][j] == "" or arrResult[i][j] == nil
				arrResult[i][j] = nil
			else
			    arrResult[i][j] = arrResult[i][j].to_i
			end
		end
	end

   return arrResult

end
