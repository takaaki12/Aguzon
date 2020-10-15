require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe 'GET #show' do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }

    before { get potepan_product_path product.id }

    it 'リクエストが成功することを確認' do
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
  end
end
