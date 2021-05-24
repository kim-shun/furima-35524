require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    user = FactoryBot.create(:user)
    @card = FactoryBot.build(:card, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it "card_tokenがあれば保存ができること" do
      expect(@card).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "card_tokenが空では登録できないこと" do
      @card.card_token = nil
      @card.valid?
      expect(@card.errors.full_messages).to include("Card token can't be blank")
    end
    it 'ユーザーが紐付いていなければ登録できない' do
      @card.user = nil
      @card.valid?
      expect(@card.errors.full_messages).to include('User must exist')
    end
  end
end
