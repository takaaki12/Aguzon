Spree::Product.class_eval do
  scope :related_products, -> (product) {
    in_taxons(product.taxons).
      where.not(id: product.id).
      distinct
  }

  scope :new_products, -> {
    includes(master: [:default_price, :images]).order(available_on: "DESC")
  }

  def self.search(search)
    return Spree::Product.all unless search
      Spree::Product.where(['name LIKE ? OR meta_description LIKE ? OR meta_keywords LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end
end
