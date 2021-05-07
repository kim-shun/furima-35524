class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '家電' },
    { id: 3, name: '小物' },
    { id: 4, name: '洋服' },
    { id: 5, name: '国際' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
