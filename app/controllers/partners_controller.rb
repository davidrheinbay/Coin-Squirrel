class PartnersController < ApplicationController
  def index
    @partners = policy_scope(Partner).order(created_at: :desc)
  end

  def new
    @partner = Partner.new
    authorize @partner
  end

  def create
    @partner = Partner.new(partner_params)
    authorize @partner
    if @partner.save
      redirect_to partners_path(partner: @partner.name)
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
    @partner.update(partner_parmas)
    if @partner.save
      redirect_to partners_path(partner: @partner.name)
    else
      render :edit
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :company_entity_name,
                                    :comission_perc, :user_commsission_perc,
                                    :referral_link, :logo_image, :card_image,
                                    :awin_advertiser_id)
  end
end
