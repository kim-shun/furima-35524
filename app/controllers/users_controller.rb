class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

    redirect_to new_card_path and return unless card.present?
    
    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end

  def update
    if current_user.update(user_params) 
      redirect_to root_path 
    else
      redirect_to action: "show" 
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date) # 編集出来る情報を制限
  end
end
