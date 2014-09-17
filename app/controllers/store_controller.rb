class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
  	@cartuchos = Cartucho.order(:title)
  end
end

