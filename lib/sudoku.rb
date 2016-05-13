
class SudokuGame
    attr_reader :resultado_validacion
    
	def initialize tablero_inicial, tablero_anterior, maximo_valor
		@tablero = tablero_inicial
		@maximo_valor = maximo_valor
		@anterior = tablero_anterior
		@resultado_validacion = []
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

	def validar_celdas_llenas
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
				if !(@tablero[i][j])
					agregar_mensaje_validacion "Casillero vacio en fila #{i + 1}, columna #{j + 1}"
				end
			end
		end
	end

	def validar_rango_numeros
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
				if @tablero[i][j] != nil and (@tablero[i][j] < 1 or @tablero[i][j] > @maximo_valor)
					agregar_mensaje_validacion "Valor fuera de rango en fila #{i + 1}, columna #{j + 1}"
				end 
			end
		end
	end

	def existen_repetidos_filas
		numeros_ingresados = []
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
                if @tablero[i][j] != nil
					if !(numeros_ingresados.include? @tablero[i][j])
						numeros_ingresados << @tablero[i][j]
					else
					    agregar_mensaje_validacion "Valor '#{@tablero[i][j]}' repetido en fila #{i + 1}"
					end 
				end
                end
			numeros_ingresados = []
		end
	end

    def agregar_mensaje_validacion mensaje
        if !(@resultado_validacion.include?(mensaje))
            @resultado_validacion << mensaje
        end
    end

    def validar_tablero
        validar_celdas_llenas
        validar_rango_numeros
        existen_repetidos_filas
    end

end

