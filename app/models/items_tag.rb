class ItemsTag

  include ActiveModel::Model
  attr_accessor :info, :name

  with_options presence: true do
    validates :info
    validates :name
  end

  def save
    item = Item.create(info: info)
    tag = Tag.create(name: name)

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end