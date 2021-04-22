require_relative "bar_model"
require_relative "bar_view"
require_relative "order_model"

class BarController
    def initialize
        @bar_model = BarModel.new 
        @bar_view = BarView.new
        @order_model = OrderModel.new 
    end

    def run
        order_is_finished = false
        until order_is_finished
            get_menu
            order = get_user_order
            if @bar_model.has_stock?(order[:name], order[:quantity])
                @bar_model.decrease_stock(order[:name], order[:quantity])
                item = @order_model.order.find { |element| element.item_name == order[:name]}
                # if the_order includes the item_name
                if item
                    item.increase_quantity(order[:quantity])
                # if the user hasn't ordered that item before
                else 
                    @order_model.add_item(order[:name], order[:quantity])
                end
            end
            response = @bar_view.ask_more_to_order
            if response == "n"
                order_is_finished = true
            end
        end
        @bar_view.display_order(@order_model.get_order_items)
    end 

    def get_menu 
        @bar_view.show_menu(@bar_model.drink_amounts)
    end

    def get_user_order
        @bar_view.get_order
    end 
end



bar = BarController.new
bar.run