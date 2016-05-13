Given(/^I visit the homepage$/) do
    visit "/"
end

When(/^I enter "([^"]*)" in row (\d+), column (\d+)$/) do |value, row, column|
    row = (row.to_i) - 1
    column = (column.to_i) - 1
    fill_in("cells[" + row.to_s + "][" + column.to_s + "]", :with => value)
end

Then(/^I should see "([^"]*)" in row (\d+), column (\d+)$/) do |value, row, column|
    row = (row.to_i) - 1
    column = (column.to_i) - 1
    response_body.should have_selector("input[name='cells[" + row.to_s + "][" + column.to_s + "]']/@value") do |element|
        element.should contain(value)
    end
end

def set_cell row, col, value
    fill_in("cells[" + row.to_s + "][" + col.to_s + "]", :with => value)
end

When(/^I fill the table correctly$/) do
    tablero = [
        [7,4,9, 6,8,5, 2,1,3],
        [3,2,5, 1,7,9, 6,4,8],
        [8,1,6, 3,4,2, 5,9,7],
        [4,6,7, 9,5,3, 8,2,1],
        [9,5,8, 2,1,7, 4,3,6],
        [1,3,2, 4,6,8, 7,5,9],
        [6,7,1, 5,3,4, 9,8,2],
        [2,8,4, 7,9,1, 3,6,5],
        [5,9,3, 8,2,6, 1,7,4]
    ]

    for i in 0..tablero.size - 1
        for j in 0..tablero[i].size - 1
            set_cell(i, j, tablero[i][j])
        end
    end
end

