def transformar_a_arreglo dict

	arrResult = []

	dict.each do |key, array|
		arrResult << array.values
	end

	for i in 0..arrResult.size - 1
		for j in 0..arrResult[i].size - 1
			if arrResult[i][j] == ""
				arrResult[i][j] = nil
			end
		end
	end

   return arrResult

end
