
class SudokuGame

	def initialize tablero_inicial, rango_inicial
		@tablero = tablero_inicial
		@rango = rango_inicial
	end

	def obtener_nro_filas
		@tablero.size
	end

	def obtener_nro_columnas
		@tablero[0].size
	end

	def obtener_num_celdas_llenas
		contador = 0
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
				if @tablero[i][j]
					contador += 1
				end 
			end
		end
		contador
	end

	def validar_celdas_llenas?
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
				if !(@tablero[i][j])
					fail "Existen celdas vacias"
				end 
			end
		end
		true
	end

	def validar_rango_numeros?
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
				if !(@rango.include? @tablero[i][j])
					fail "Valor fuera de rango"
				end 
			end
		end
		true
	end

	def existen_repetidos_fila?
		numeros_ingresados = []
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
				if !(numeros_ingresados.include? @tablero[i][j])
					numeros_ingresados << @tablero[i][j]
				else
					fail "Existen valores repetidos en fila"
				end 
			end
			numeros_ingresados = []			
		end
		true
	end

	def validar_reglas?
		begin
			if validar_celdas_llenas? && validar_rango_numeros? && existen_repetidos_fila?
				return "Cumple con las reglas"
			else
				return "No cumple"
			end
		rescue Exception => e
			puts "RULES EXCEPTION"
		   	return e.message
		end
	end

end

