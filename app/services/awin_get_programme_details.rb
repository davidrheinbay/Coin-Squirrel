require 'open-uri'

class AwinGetProgrammeDetails
  @api_key = ENV["AWIN_API_KEY"]
  @publisher_id = ENV["AWIN_PUBLISHER_ID"]

  def self.call(programme)
    @programme = programme
    new.fetch_programme_details(@programme["id"])
  end

  def fetch_programme_details(id)
    api_uri = "https://api.awin.com/publishers/#{@publisher_id}/
              programmedetails?advertiserId=#{id}&accessToken=#{@api_key}"
    @detail_payload = JSON.parse(open(api_uri).read)
    parse_detail_payload
  end

  private

# PLEASE UPDATE THIS FUNCTION SO THAT IT USES PARTNER#CREATE AND PARTNER#UPDATE

  def parse_detail_payload
    programme_info = @detail_payload["programmeInfo"]
    commission_info = @detail_payload["commissionRange"]
    if Partner.exists?(awin_advertiser_id: programme_info['id'])
      partner = Partner.find_by_awin_advertiser_id(programme_info['id'])
      partner.commission_perc = commission_info[0]["min"]
      partner.referral_link = programme_info["clickThroughUrl"]
      partner.awin_advertiser_id = programme_info['id']
      partner.save
    else
      partner = Partner.new
      partner.name = programme_info['name']
      partner.commission_perc = commission_info[0]["min"]
      partner.referral_link = programme_info["clickThroughUrl"]
      partner.awin_advertiser_id = programme_info['id']
      partner.create
    end
  end
end
