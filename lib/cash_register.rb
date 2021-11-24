require "pry"

class CashRegister
    attr_accessor :total
    attr_reader :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def total
        @total
    end

    def add_item (title, price, quantity = 1)
        self.total += (price * quantity)
        @cart << {title: title, price: price, quantity: quantity}
    end

    # if @discount > 0
    #     apply_discount
    # end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else 
            discounted = @total - (@total * @discount/100)
            self.total = discounted
            "After the discount, the total comes to $#{self.total}."
        end
    end 

    def items 
        three_args = []
        @cart.map do |item|
            if item[:quantity] > 1
                count = item[:quantity]
                while count > 0
                    three_args << item[:title]
                    count -= 1
                end
            end
        end

        if three_args.length > 0
            return three_args
         end

        two_args = @cart.map do |item| 
            item[:title]
        end

        two_args
        # binding.pry
    end

    def void_last_transaction
            self.total = @total - (@cart.last()[:price] * @cart.last()[:quantity])
    end

end

register = CashRegister.new
register.add_item("Milk", 5)
register.add_item("Beef", 12)

register.items
