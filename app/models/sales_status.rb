class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '良好' },
    { id: 3, name: 'ボロボロ' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
