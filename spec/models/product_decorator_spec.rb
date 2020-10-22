require 'rails_helper'

RSpec.describe 'ProductDecorator_model', type: :model do
  let(:category) { create(:taxonomy, name: "Category") }
  let!(:taxon) { create(:taxon, name: "Taxon", taxonomy: category, parent: category.root) }
  let!(:product) { create(:product, taxons: [taxon], name: "Product") }

  describe "related_products" do
    let!(:related_products_scope) do
      Spree::Product.related_products(product)
    end

    context "There are 3 related products" do
      let!(:related_products) do
        3.times.collect do |i|
          create(:product, taxons: [taxon])
        end
      end

      it "Will only get 3 products" do
        expect(related_products_scope.size).to eq 3
      end
    end

    context "There are 4 related products" do
      let!(:related_products) do
        4.times.collect do |i|
          create(:product, taxons: [taxon])
        end
      end

      it "Will get 4 products" do
        expect(related_products_scope.size).to eq 4
      end
    end
  end
end
