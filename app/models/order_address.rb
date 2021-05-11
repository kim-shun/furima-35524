class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/} #gsub(/-/,'')
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"} 

  def save
    
    order = Order.create(item_id: item_id, user_id: user_id)
    
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end