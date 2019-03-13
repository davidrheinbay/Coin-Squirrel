require 'rest_client'

class GiftbitLoader
  def call(id)
    values = "{
      'brand_code': 'itunesus',
      'price_in_cents': 2500,
      'id': #{id + 1}#{rand(1..999)}
    }"

    headers = {
      content_type: 'application/json',
      authorization: "Bearer #{ENV['GIFTBIT_KEY']}"
    }

    response = RestClient.post 'https://api-testbed.giftbit.com/papi/v1/embedded',
                                values, headers

    jason = JSON.parse(response)
    p jason
  end
end
