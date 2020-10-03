require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe 'GET #index' do
    it '/potepanリクエストでtitleが表示されること' do
      get potepan_path
      expect(response.body).to include("#{BASE_TITLE}")
    end

    it '/potepan/indexリクエストでtitleが表示されること' do
      get potepan_index_path
      expect(response.body).to include("#{BASE_TITLE}")
    end
  end

  describe 'GET #show' do
    let!(:product) { create(:product) }

    before { get potepan_product_path product.id }

    it 'リクエストが成功することを確認' do
      expect(response.status).to eq 200
    end

    it 'product名が表示されていること' do
      expect(response.body).to include product.name.to_s
    end

    it 'productの値段が表示されていること' do
      expect(response.body).to include product.display_price.to_s
    end

    it 'productの画像が表示されていること' do
      product.images.each do |image|
        expect(response.body).to include product.image
      end
    end

    it 'productの説明文が表示されていること' do
      expect(response.body).to include product.description.to_s
    end

    it 'productのtitleが表示されていること' do
      expect(response.body).to include("#{product.name} - #{BASE_TITLE}")
    end
  end
end
