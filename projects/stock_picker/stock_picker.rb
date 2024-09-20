def stock_picker(stock_price_array)
  largest_profit    = 0
  buy_and_sell_days = [0, 0]

  stock_price_array.each_with_index do |profit_one, day_one|

    stock_price_array.each.with_index do |profit_two, day_two|
      next if day_two <= day_one

      if profit_two - profit_one > largest_profit
        largest_profit    = profit_two - profit_one
        buy_and_sell_days = [day_one, day_two]
      end
    end
  end

  p buy_and_sell_days
end


stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12