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
        get_menu
        item_name = get_user_order
        if @bar_model.has_stock?(item_name)
            @bar_model.decrease_stock(item_name)
            @order_model.add_item(item_name)
            @bar_view.display_order(@order_model.get_order_items)
        end 
    end 

    def get_menu 
        @bar_view.show_menu(@bar_model.drink_amounts)
    end

    def get_user_order
        @bar_view.get_order(@bar_model.drink_amounts)
    end 
end



bar = BarController.new
bar.run