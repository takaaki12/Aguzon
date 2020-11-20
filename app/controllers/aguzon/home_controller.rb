class Aguzon::HomeController < ApplicationController
  MAX_NEW_PRODUCTS = 8

  def index
    @new_products = Spree::Product.new_products.limit(MAX_NEW_PRODUCTS)
  end

  def about_us
  end

  def cart_page
  end

  def product_grid_left_sidebar
  end
end
