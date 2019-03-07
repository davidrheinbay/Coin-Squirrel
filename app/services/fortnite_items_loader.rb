require 'open-uri'

class FortniteItemsLoader
  API_URI = "https://fortnite-public-api.theapinetwork.com/prod09/store/get"

  def self.call
    new.fetch_items
  end

  def fetch_items
    @payload = JSON.parse(open(API_URI).read)
    parse_payload
  end

  private

  def parse_payload
    items = @payload['items']
    items.map do |item|
      FortniteItem.new(
        name: item['name'],
        rarity: item['item']['rarity'],
        image: item['item']['images']['transparent'],
        cost: item['cost'],
        currency: item['item']['obtained_type'],
        rating: item['ratings']['avgStars'],
        votes: item['ratings']['numberVotes']
      )
    end
  end
end
