class PartnersController < ApplicationController
  def index
    if params[:query].present?
      @partners = policy_scope(Partner).search_by_name_and_tags(params[:query])
    else
      @partners = policy_scope(Partner).order(commission_perc: :desc)
    end
    @exchange_rate = ExchangeRate.where("game_id = ? AND currency_origin_short = 'EUR'", current_user.game_id).last.rate
    @game_currency = ExchangeRate.where("game_id = ? AND currency_origin_short = 'EUR'", current_user.game_id)
                                 .last
                                 .currency_target_short
  end

  def new
    @partner = Partner.new
    authorize @partner
  end

  def create
    @partner = Partner.new(partner_params)
    authorize @partner
    if @partner.save
      redirect_to partners_path(nil, partner: @partner.name)
    else
      render :new
    end
  end

  def edit
    @partner = Partner.find(params[:id])
    authorize @partner
  end

  def update
    @partner = Partner.find(params[:id])
    authorize @partner
    @partner.update(partner_params)
    if @partner.save
      redirect_to partners_path(nil, partner: @partner.name)
    else
      render :edit
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :company_entity_name,
                                    :commission_perc, :user_commission_perc,
                                    :referral_link, :logo_image, :card_image,
                                    :awin_advertiser_id)
  end
end
