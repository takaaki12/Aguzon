require 'rails_helper'

RSpec.feature "Products", type: :feature do
  let(:taxon) { create(:taxon) }
  let(:product) { create(:product, taxons: [taxon], price: 123) }
  let!(:related_product) { create(:product, taxons: [taxon], price: 111) }

  background do
    visit potepan_product_path(product.id)
  end

  scenario "プロダクトページにアクセスしたら、その商品の詳細情報が表示される" do
    within('.media-body') do
      expect(page).to have_title product.name
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_content product.description
    end
  end

  scenario "プロダクトページにアクセスしたら、その商品の関連商品が表示される" do
    within('.productsContent') do
      expect(page).not_to have_content product.name
      expect(page).not_to have_content product.display_price
      expect(page).to have_content related_product.name
      expect(page).to have_content related_product.display_price
    end
  end

  scenario "「一覧ページに戻る」をクリックしたら、その商品のカテゴリページが表示される" do
    click_on '一覧ページへ戻る'
    expect(page).to have_title taxon.name
    expect(page).to have_content product.name
  end
end
