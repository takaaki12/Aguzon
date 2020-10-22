require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe 'GET #show' do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) do
      4.times.collect do |i|
        create(:product, name: "related_product_#{i}",
                         price: "#{rand(1.0..99.9).round(2)}",
                         taxons: [taxon])
      end
    end

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
      it 'related_product名が表示されていること' do
        expect(response.body).to include related_products.first.name
      end

      it 'related_productの値段が表示されていること' do
        expect(response.body).to include related_products.first.display_price.to_s
      end
    end
  end
end
