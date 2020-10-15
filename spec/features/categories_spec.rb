require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  let(:taxonomy) { create(:taxonomy, name: 'test_taxonomy') }
  let(:taxon) { create(:taxon, name: 'test_taxon', parent: taxonomy.root) }
  let!(:product) { create(:product, taxons: [taxon]) }
  let!(:other_taxonomy) { create(:taxonomy, name: 'test_other_taxonomy') }
  let!(:other_taxon) { create(:taxon, name: 'test_ohter_taxon', parent: other_taxonomy.root) }
  let!(:other_product) { create(:product, name: 'test_other_product', taxons: [other_taxon]) }

  background do
    visit potepan_category_path(taxon.id)
  end

  scenario "商品カテゴリの表示を確認する。" do
    expect(page).to have_title taxon.name
    expect(page).to have_content product.name
    within('.side-nav') do
      expect(page).to have_content taxonomy.name
      expect(page).to have_content taxon.name
      expect(page).to have_content taxon.product_ids.count
      expect(page).to have_link taxon.name
      expect(page).to have_content other_taxonomy.name
      expect(page).to have_content other_taxon.name
      expect(page).to have_content other_taxon.product_ids.count
      expect(page).to have_link other_taxon.name
    end
  end

  scenario "商品カテゴリの画面間の移動を確認する。" do
    click_on other_taxon.name
    expect(current_path).to eq potepan_category_path(other_taxon.id)
  end

  scenario "商品カテゴリ名から商品詳細ページへの移動を確認する。" do
    click_on product.name
    expect(current_path).to eq potepan_product_path(product.id)
  end

  scenario "商品カテゴリ価格表示から商品詳細ページへの移動を確認する。" do
    click_on product.display_price.to_s
    expect(current_path).to eq potepan_product_path(product.id)
  end

  scenario "別カテゴリの商品が表示されていないことを確認する。" do
    expect(page).not_to have_content other_product.name
  end
end
