require 'rest_client'

class GiftbitLoader

  def get

    values = '{
      "brand_code": "itunesus",
      "price_in_cents": 2500,
      "id": "myGift12345"
    }'

    headers = {
      content_type: 'application/json',
      authorization: ENV['GIFTBIT_KEY']
    }

    response = RestClient.post 'https://api-testbed.giftbit.com/papi/v1/embedded', values, headers
    puts response
  end
end
