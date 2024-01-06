def stock_picker(days)
    days.max == days[0] ? max = days.sort[-2] : max = days.max

    stock = days[0..days.index(max)]
    min = stock.min

    [min, max]
end

p stock_picker([300,3,6,9,15,8,6,1,1])