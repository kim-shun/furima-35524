class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_many :sns_credentials
  has_many :items
  has_many :orders
  has_many :comments
  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :birth_date

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ン]+\z/, message: '全角文字(カタカナ)を使用してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
