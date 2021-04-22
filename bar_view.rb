class BarView 
    def show_menu(drinks)
        puts "What would you like to order?"
        item_num = 1
        drinks.each do |key, val|
            puts "#{item_num}. #{key}"
            item_num += 1 
        end
    end 

    def get_order
        puts "Enter drink name: "
        drink_name = gets.strip.downcase
        puts "Enter drink quantity"
        drink_quantity = gets.chomp.to_i
        return {name: drink_name, quantity: drink_quantity}
    end

    def ask_more_to_order
        puts "Is there more to order?"
        return gets.strip.downcase
    end

    def display_order(order)
        puts "Here is your order"
        order.each_with_index do |item, index|
            puts "#{index+1}. #{item.qty}x #{item.item_name}"
        end
    end
end 