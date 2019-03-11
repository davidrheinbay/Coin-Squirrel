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
    @programme_info = @detail_payload["programmeInfo"]
    @commission_info = @detail_payload["commissionRange"]
    if Partner.exists?(awin_advertiser_id: @programme_info['id'])
      update_partner
    else
      create_new_partner
    end
  end

  def update_partner
    partner = Partner.find_by_awin_advertiser_id(@programme_info['id'])
    partner.commission_perc = @commission_info[0]["min"]
    partner.referral_link = @programme_info["clickThroughUrl"]
    partner.save
  end

  def create_new_partner
    partner = Partner.new
    partner.name = @programme_info['name']
    partner.company_entity_name = "Company #{@programme_info['id']}"
    partner.commission_perc = @commission_info[0]["min"]
    partner.user_commission_perc = partner.commission_perc / 2
    partner.referral_link = @programme_info["clickThroughUrl"]
    partner.awin_advertiser_id = @programme_info['id']
    partner.save
  end
end
