
class Cell
    attr_reader :read_only, :value, :row, :column
    def initialize row, column, value
        @row = row
        @column = column
        @value = value
        if value != nil
            @read_only = true
        else
            @read_only = false
        end
    end

    def name
        "cells[" + @row + "][" + @column + "]"
    end

    def set_value value
        if @read_only
            fail "No se puede modificar celda de solo lectura"
        end
        @value = value
    end
end
