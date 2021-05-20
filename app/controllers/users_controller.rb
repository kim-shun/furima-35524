class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items
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
