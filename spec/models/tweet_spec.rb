require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context  "ツイートが保存できる場合" do
      it "画像とテキストがあればツイートは保存される", js: true do
        expect(@tweet).to be_valid
      end

      it "テキストがあればツイートは保存される", js: true do
        @tweet.image = ""
        expect(@tweet).to be_valid
      end
    end

    context  "ツイートが保存できない場合" do
      it "テキストがないとツイートは保存できない", js: true do
        @tweet.text = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end

      it "ユーザーが紐づいてないとツイートは保存できない", js: true do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
    
  end
end
