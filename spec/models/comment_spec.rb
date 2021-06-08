require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
  end

  it 'テキストが埋まっていればコメントできること' do
    expect(@comment).to be_valid
  end

  it 'テキストが空ではコメントできないこと' do
    @comment.text = ""
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Text can't be blank")
  end

  it 'userが紐付いていないと保存できないこと' do
    @comment.user_id = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include("User must exist")
  end

  it 'itemが紐付いていないと保存できないこと' do
    @comment.item_id = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Item must exist")
  end
end
