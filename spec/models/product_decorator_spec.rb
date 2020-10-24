require 'rails_helper'

RSpec.describe 'ProductDecorator', type: :model do
  let(:taxon) { create(:taxon) }
  let(:other_taxon) { create(:taxon) }
  let(:another_taxon) { create(:taxon) }
  let(:product) { create(:product, taxons: [taxon, other_taxon]) }
  let(:first_other_product) { create(:product, taxons: [taxon]) }
  let(:second_other_product) { create(:product, taxons: [other_taxon]) }
  let(:another_product) { create(:product, taxons: [another_taxon]) }

  describe '#related_products' do
    let(:related_products_scope) do
      Spree::Product.related_products(product)
    end

    it '同じカテゴリの商品のみ返す' do
      expect(related_products_scope).to match_array [first_other_product, second_other_product]
    end

    it 'product自身は含まれていない' do
      expect(related_products_scope).not_to include(product)
    end

    it 'another_productは含まれていない' do
      expect(related_products_scope).not_to include(another_product)
    end
  end
end
