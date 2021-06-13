class Admin::HomesController < ApplicationController
def top
  @orders = Order.all
  @customers = Customer.all
end

end
