class ShippingFeeStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '着払い' },
    { id: 3, name: '送料込み' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
