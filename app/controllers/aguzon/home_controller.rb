class Aguzon::HomeController < ApplicationController
  MAX_NEW_PRODUCTS = 8

  def index
    @new_products = Spree::Product.new_products.limit(MAX_NEW_PRODUCTS)
    @entries = Spree::BlogEntry.recent(4)
  end

  def about_us
  end
end
