require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe 'GET #show' do
    let!(:product) { create(:product) }
      it 'リクエストが成功することを確認' do
        get potepan_product_path product.id
        expect(response.status).to eq 200
      end

      it 'product名が表示されていること' do
        get potepan_product_path product.id
        expect(response.body).to include product.name.to_s
      end

      it 'productの値段が表示されていること' do
        get potepan_product_path product.id
        expect(response.body).to include product.price.to_s
      end

      it 'productの画像が表示されていること' do
        get potepan_product_path product.id
          product.images.each do |image|
            expect(response.body).to include product.image
          end
      end

      it 'productの説明文が表示されていること' do
        get potepan_product_path product.id
        expect(response.body).to include product.description.to_s
      end
    end

    context 'productが存在しない場合' do
      subject { -> { get potepan_product_path 1 } }

      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
end
