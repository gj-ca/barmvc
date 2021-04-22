class BarView 
    def show_menu(drinks)
        puts "What would you like to order?"
        item_num = 1
        drinks.each do |key, val|
            puts "#{item_num}. #{key}"
            item_num += 1 
        end
    end 

    def get_order(drinks)
        print "Enter drink name: "
        return gets.strip.downcase
        print "How many?"
        return gets.strip.to_i
    end

    def display_order(order)
        puts "Here is your order"
        order.each_with_index do |item, index|
            puts "#{index+1}. #{item[:qty]}x #{item[:item_name]}"
        end
    end
end 