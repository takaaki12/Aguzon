require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe 'GET #show' do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) { create_list(:product, 5, taxons: [taxon]) }

    before { get potepan_product_path product.id }

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'product名が表示されていること' do
      expect(response.body).to include product.name
    end

    it 'productの値段が表示されていること' do
      expect(response.body).to include product.display_price.to_s
    end

    it 'productの説明文が表示されていること' do
      expect(response.body).to include product.description
    end

    it 'productのtitleが表示されていること' do
      expect(response.body).to include("#{product.name} - #{BASE_TITLE}")
    end

    context 'productがTaxonsを持つとき' do
      it 'related_productが5件以上あるときでも、@related_productsへの格納数は4件であること' do
        expect(controller.instance_variable_get("@related_products").length).to eq 4
      end
    end
  end
end
