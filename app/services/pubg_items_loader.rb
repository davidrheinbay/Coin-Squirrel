require 'open-uri'

class PubgItemsLoader
  API_URI = "https://steamcommunity.com/market/search/render/?appid=578080&norender=1&count=500"

  def self.call
    new.fetch_items
  end

  def fetch_items
    @payload = JSON.parse(open(API_URI).read)
    parse_payload
  end

  private

  def parse_payload
    items = @payload['results']
    items.map do |item|
      PubgItem.new(
        name: item['name'],
        rarity: 'uncommon',
        image: "https://steamcommunity-a.akamaihd.net/economy/image/#{item['asset_description']['icon_url']}",
        cost: set_price(item['sell_price_text']) * 10,
        currency: 'G-coins',
        rating: rand(0...5),
        votes: rand(0...500)
      )
    end
  end

  def set_price(price)
    price.split("")[1..2].join.to_i
  end
end
