class Aguzon::SearchesController < ApplicationController

  def index
    @products = Spree::Product.search(params[:search]).limit(132)
    @search = params[:search]
  end
end
