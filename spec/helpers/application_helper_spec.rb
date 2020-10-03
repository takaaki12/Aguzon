require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'Application Title helpers' do
    it "titleが正しく表示されること" do
      expect(full_title("")).to eq BASE_TITLE
      expect(full_title("Test")).to eq "Test - #{BASE_TITLE}"
    end
  end
end
