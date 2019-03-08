require 'open-uri'

class AwinGetProgrammeDetails
  def initialize(programme)
    @api_key = ENV["AWIN_API_KEY"]
    @publisher_id = ENV["AWIN_PUBLISHER_ID"]
    @advertiser_id = programme["id"]
  end

  def call
    fetch_programme_details
  end

  def fetch_programme_details
    api_uri = "https://api.awin.com/publishers/#{@publisher_id}/programmedetails?advertiserId=#{@advertiser_id}&accessToken=#{@api_key}"
    @detail_payload = JSON.parse(open(api_uri).read)
    parse_detail_payload
  end

  private

  # PLEASE UPDATE THIS FUNCTION SO THAT IT USES PARTNER#CREATE AND PARTNER#UPDATE

  def parse_detail_payload
    p @detail_payload
    # uncomment after creating partner controller

    # programme_info = @detail_payload["programmeInfo"]
    # commission_info = @detail_payload["commissionRange"]
    # if Partner.exists?(awin_advertiser_id: programme_info['id'])
    #   partner = Partner.find_by_awin_advertiser_id(programme_info['id'])
    #   partner.commission_perc = commission_info[0]["min"]
    #   partner.referral_link = programme_info["clickThroughUrl"]
    #   partner.awin_advertiser_id = programme_info['id']
    #   partner.save
    # else
    #   partner = Partner.new
    #   partner.name = programme_info['name']
    #   partner.commission_perc = commission_info[0]["min"]
    #   partner.referral_link = programme_info["clickThroughUrl"]
    #   partner.awin_advertiser_id = programme_info['id']
    #   partner.create
    # end
  end
end
