require 'rails_helper'
describe ItemsController, type: :request do
  
  before do
    @item = FactoryBot.create(:item)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスに出品済みの商品名が存在する' do 
      get root_path
      expect(response.body).to include(@item.name)
    end

    #画像のテストコードがまだ

    it 'indexアクションにリクエストするとレスポンスに商品検索フォームが存在する' do 
      get root_path
      expect(response.body).to include('検索')
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get item_path(@item)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに出品済みの商品名が存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.name)
    end
    
    it 'showアクションにリクエストするとレスポンスに出品者名が存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.user.nickname)
    end

    #カテゴリー以降とコメントもある
  end 
end
