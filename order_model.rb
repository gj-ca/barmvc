class Item
    attr_reader :item_name, :qty

    def initialize(item_name, qty)
        @item_name = item_name
        @qty = qty
    end

    def increase_quantity(quantity)
        @qty += quantity
    end
end

class OrderModel
    attr_reader :order
    def initialize
        @order = []
    end

    def add_item(item_name, qty=1)
        @order << Item.new(item_name, qty)
    end

    def get_order_items
        @order
    end
end 