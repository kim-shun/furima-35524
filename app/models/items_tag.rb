class ItemsTag

  include ActiveModel::Model
  attr_accessor :name, :info, :price, :images, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :tag_name, :user_id

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :images
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :user_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  def save
    item = Item.create(name: name, info: info, price: price, images: images, category_id: category_id, sales_status_id: sales_status_id, shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end