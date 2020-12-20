class Aguzon::BlogEntryController < ApplicationController
  def index
    @entries = Spree::BlogEntry.recent(10)
  end

  def show
    @entry = Spree::BlogEntry.find(params[:id])
    @entries = Spree::BlogEntry.recent(3)
  end
end
