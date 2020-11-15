require 'rails_helper'

RSpec.describe "Aguzon::Homes", type: :request do
  describe 'GET #index' do
    let!(:old_product) { create(:product, available_on: 3.day.ago) }
    let!(:new_products) { create_list(:product, 9, available_on: 2.day.ago) }
    let!(:first_product) { create(:product, available_on: 1.day.ago) }

    before { get aguzon_path }

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'first_product名が表示されていること' do
      expect(response.body).to include first_product.name
    end

    it 'old_product名が表示されていないこと' do
      expect(response.body).not_to include old_product.name
    end

    it 'first_productの値段が表示されていること' do
      expect(response.body).to include first_product.display_price.to_s
    end

    it 'productのtitleが表示されていること' do
      expect(response.body).to include("#{BASE_TITLE}")
    end

    it 'new_productが9件以上あるときでも、@new_productsへの格納数は8件であること' do
      expect(controller.instance_variable_get("@new_products").length).to eq 8
    end
  end
end
