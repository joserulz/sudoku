require_relative "cell.rb"

class SudokuGame
    attr_reader :resultado_validacion, :tablero
    
	def initialize valores_tablero, rows, cols, maximo_valor
	    @tablero = []
	    for i in 0..rows - 1
	        @tablero[i] = []
	        for j in 0..cols - 1
	            @tablero[i][j] = Cell.new i, j, valores_tablero[i][j]
	        end
	    end
		@maximo_valor = maximo_valor
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
				if @tablero[i][j].value != nil
					contador += 1
				end 
			end
		end
		contador
	end

	def validar_celdas_llenas
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
				if @tablero[i][j].value == nil
					agregar_mensaje_validacion "Casillero vacio en fila #{i + 1}, columna #{j + 1}"
				end
			end
		end
	end

	def existen_repetidos_filas
		numeros_ingresados = []
		for i in 0..@tablero.size - 1
			for j in 0..@tablero[i].size - 1
                if @tablero[i][j].value != nil
					if !(numeros_ingresados.include? @tablero[i][j].value)
						numeros_ingresados << @tablero[i][j].value
					else
					    agregar_mensaje_validacion "Valor '#{@tablero[i][j].value}' repetido en fila #{i + 1}"
					end 
				end
                end
			numeros_ingresados = []
		end
	end

    def procesar_tablero nuevo_tablero
        for i in 0..@tablero.size - 1
            for j in 0..@tablero[i].size - 1
                celda = @tablero[i][j]
                if !celda.read_only
                    valor = nuevo_tablero[i][j]
                    if valor != nil and valor != celda.value
                        if valor >= 1 and valor <= @maximo_valor
                            celda.set_value valor
                        else
                            agregar_mensaje_validacion "Valor fuera de rango en fila #{i + 1}, columna #{j + 1}"
                        end
                    end
                end
            end
        end
        return @tablero
    end

    def agregar_mensaje_validacion mensaje
        if !(@resultado_validacion.include?(mensaje))
            @resultado_validacion << mensaje
        end
    end

    def validar_tablero
        validar_celdas_llenas
        existen_repetidos_filas
    end

end

