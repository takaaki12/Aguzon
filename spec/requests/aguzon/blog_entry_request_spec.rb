require 'rails_helper'

RSpec.describe "Aguzon::BlogEntries", type: :request do
  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get aguzon_blog_entry_index_path
      expect(response.status).to eq 200
    end
  end
end
