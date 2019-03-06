require 'open-uri'

class AwinGetJoinedProgrammes

  api_key = ENV["AWIN_API_KEY"]

  API_URI = "https://api.awin.com/publishers/45628/programmes?relationship=joined&accessToken=#{api_key}"

  def self.call
    new.fetch_programmes
  end

  def fetch_programmes
    @payload = JSON.parse(open(API_URI).read)
    parse_payload
  end

  private

  def parse_payload
    programmes = @payload['programmes']
    programmes.map do |proramme|
      AwinGetProgrammeDetails(programme)
    end
  end
end
