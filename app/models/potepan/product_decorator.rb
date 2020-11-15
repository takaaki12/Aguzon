Spree::Product.class_eval do
  scope :related_products, -> (product) {
    in_taxons(product.taxons).
      where.not(id: product.id).
      distinct
  }

  scope :new_products, -> {
    includes(master: [:default_price, :images]).order(available_on: "DESC")
  }
end
