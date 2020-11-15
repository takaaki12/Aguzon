require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    context "引数が与えられなかった時" do
      it "ベースとなるタイトル文字列だけを返す" do
        expect(full_title).to eq 'AGUZON Store'
      end
    end

    context "引数に空文字が与えられた時" do
      it "ベースとなるタイトル文字列だけを返す" do
        expect(full_title("")).to eq BASE_TITLE
      end
    end

    context "引数に1つ以上の文字列が与えられた時" do
      it "与えられた文字列とベースとなるタイトル文字列が「 - 」を挟んで返される" do
        expect(full_title("Test")).to eq "Test - #{BASE_TITLE}"
      end
    end
  end
end
