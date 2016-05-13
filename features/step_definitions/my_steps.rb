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
