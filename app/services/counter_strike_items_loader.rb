require 'open-uri'

class CounterStrikeItemsLoader
  API_URI = "https://bitskins.com/api/v1/get_price_data_for_items_on_sale/?api_key=80669832-04de-4698-9635-11e5c7d1f425&app_id=730&code=522253"

  def self.call
    new.fetch_itmes
  end

  def fetch_itmes
    @payload = JSON.parse(open(API_URI).read)
    parse_payload
  end

  private

  def parse_payload
    items = @payload['data']['items']
    items.map do |item|
      CounterStrikeItem.new(
        name: item['market_hash_name'],
        rarity: 'uncommon',
        image: 'https://images-na.ssl-images-amazon.com/images/I/81L8-mjNlrL._SX425_.jpg',
        cost: item['lowest_price'],
        currency: '$',
        rating: 2,
        votes: 130
      )
    end
  end
end
