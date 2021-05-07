class ScheduledDelivery < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1日〜3日' },
    { id: 3, name: '4日〜6日' },
    { id: 4, name: '7日以上' }
  ]

  include ActiveHash::Associations
  has_many :items
end
