class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    
    order = Order.create(item_id: item_id, user_id: user_id)
    
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, order_id: order.id)
  end
end