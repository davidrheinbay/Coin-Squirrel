require 'open-uri'

class AwinGetJoinedProgrammes
  def initialize
    @api_key = ENV["AWIN_API_KEY"]
    @publisher_id = ENV["AWIN_PUBLISHER_ID"]
    @api_uri = "https://api.awin.com/publishers/#{@publisher_id}/programmes?relationship=joined&accessToken=#{@api_key}"
  end

  def call
    fetch_programmes
  end

  def fetch_programmes
    @payload = JSON.parse(open(@api_uri).read)
    parse_payload
  end

  private

  def parse_payload
    @payload.each do |programme|
      AwinGetProgrammeDetails.new(programme).call
    end
  end
end
