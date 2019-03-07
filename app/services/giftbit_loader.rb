require 'rest_client'

class GiftbitLoader
  def get
    values = "{
      'brand_code': 'itunesus',
      'price_in_cents': 2500,
      'id': #{rand(1..999)}
    }"

    headers = {
      content_type: 'application/json',
      authorization: "Bearer #{ENV['GIFTBIT_KEY']}"
    }

    response = RestClient.post 'https://api-testbed.giftbit.com/papi/v1/embedded',
                                values, headers

    jason = JSON.parse(response)
    puts jason["gift_link"]
  end
end
