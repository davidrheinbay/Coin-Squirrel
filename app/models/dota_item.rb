class DotaItem
  include ActiveModel::Model
  attr_accessor :name, :image, :rarity, :cost, :currency, :rating, :votes
end

