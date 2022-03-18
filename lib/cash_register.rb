require 'pry'

class CashRegister
  attr_accessor :discount, :total, :item, :items, :price, :q

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, q=1)
    @item = item
    @price = price
    @q = q
    self.items << @item
    if q > 1
      price = price * q
      self.items.concat([self.item]*(q-1))
    end
    self.total = @total + price
  end

  def apply_discount
    self.total = self.total - (self.discount/100.0)*self.total
    if self.discount == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{self.total.round}."
    end
  end

  def void_last_transaction
    self.items.pop
    self.total = self.total - self.price*self.q
    if self.q > 1
      self.items = self.items.slice(self.q)
    end
    # binding.pry
  end

end


# c1 = CashRegister.new
# # c1.add_item("apple", 0.99)
# c1.add_item("tomato", 1.76, 2)
# c1.void_last_transaction

