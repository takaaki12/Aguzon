class Aguzon::CategoriesController < ApplicationController
  def show
    @taxonomies = Spree::Taxonomy.all.includes(:taxons)
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.all_products.includes(master: [:images, :default_price])

    if params[:sort]
      @products =
        if params[:sort] == "NEW_PRODUCT"
          @products.order(available_on: "DESC")
        elsif params[:sort] == "OLD_PRODUCT"
          @products.order(available_on: "ASC")
        end
    end
  end

  def product_list_left_sidebar
    @taxonomies = Spree::Taxonomy.all.includes(:taxons)
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.all_products.includes(master: [:images, :default_price])

    if params[:sort]
      @products =
        if params[:sort] == "NEW_PRODUCT"
          @products.order(available_on: "DESC")
        elsif params[:sort] == "OLD_PRODUCT"
          @products.order(available_on: "ASC")
        end
    end
  end
end
