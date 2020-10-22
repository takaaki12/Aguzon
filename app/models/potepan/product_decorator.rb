Spree::Product.class_eval do
  scope :related_products, ->(product) {
    in_taxons(product.taxons).
      where.not(id: product.id).
      distinct
  }
end
