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

    it 'showアクションにリクエストするとレスポンスにカテゴリーが存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.category.name)
    end

    it 'showアクションにリクエストするとレスポンスに商品の状態が存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.sales_status.name)
    end

    it 'showアクションにリクエストするとレスポンスに配送料の負担が存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.shipping_fee_status.name)
    end

    it 'showアクションにリクエストするとレスポンスに発送元の地域が存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.prefecture.name)
    end

    it 'showアクションにリクエストするとレスポンスに発送日の目安が存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.scheduled_delivery.name)
    end

    #コメントもある
  end 
end
