class Aguzon::CategoriesController < ApplicationController
  def show
    @taxonomies = Spree::Taxonomy.all.includes(:taxons)
    @taxon = Spree::Taxon.find(params[:id])
    @products = Spree::Product.includes(master: [:images, :default_price]).in_taxon(@taxon)
  end
end
