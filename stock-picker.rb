#Store array of stock prices (one for day) in a variable
#Create a method that takes the array and returns a pair of days representing the best day to buy and best day to sell (maximize profit)
#Pay attention to edge cases (eg lowest price is last day and/or highest price is first day)

puts "Enter the stock prices for the week:"
stock_prices = gets.chomp.split(/,/)
def stock_picker(prices)
    prices.map!(&:to_i)

    mod_prices = prices
    if mod_prices.max == mod_prices[0] #Max price edge case
        mod_prices.shift
    elsif mod_prices.min == mod_prices[-1] #Min price edge case
        mod_prices.pop
    end

    if mod_prices.index(mod_prices.max) > mod_prices.index(mod_prices.min)
        puts "Buy on day #{prices.index(mod_prices.min) + 1} and sell on day #{prices.index(mod_prices.max) + 1} for a max profit of $#{mod_prices.max - mod_prices.min}"
        return
    end

    test_array = []
    r = 0
    until mod_prices[r + 1] < mod_prices[r]
        test_array << mod_prices[r]
        r += 1
    end
    test_array << mod_prices[r]
    r = 0
    puts "Buy on day #{prices.index(test_array.min) + 1} and sell on day #{prices.index(test_array.max) + 1} for a max profit of $#{test_array.max - test_array.min}"

end

stock_picker(stock_prices)