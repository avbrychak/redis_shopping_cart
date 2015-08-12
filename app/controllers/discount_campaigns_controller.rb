class DiscountCampaignsController < ApplicationController
  before_action :set_discount_campaign, only: [:show, :edit, :update, :destroy]

  # GET /discount_campaigns
  # GET /discount_campaigns.json
  def index
    @discount_campaigns = DiscountCampaign.all
  end

  # GET /discount_campaigns/1
  # GET /discount_campaigns/1.json
  def show
  end

  # GET /discount_campaigns/new
  def new
    @discount_campaign = DiscountCampaign.new
  end

  # GET /discount_campaigns/1/edit
  def edit
  end

  # POST /discount_campaigns
  # POST /discount_campaigns.json
  def create
    @discount_campaign = DiscountCampaign.new(discount_campaign_params)

    respond_to do |format|
      if @discount_campaign.save
        format.html { redirect_to @discount_campaign, notice: 'Discount campaign was successfully created.' }
        format.json { render :show, status: :created, location: @discount_campaign }
      else
        format.html { render :new }
        format.json { render json: @discount_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discount_campaigns/1
  # PATCH/PUT /discount_campaigns/1.json
  def update
    respond_to do |format|
      if @discount_campaign.update(discount_campaign_params)
        format.html { redirect_to @discount_campaign, notice: 'Discount campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @discount_campaign }
      else
        format.html { render :edit }
        format.json { render json: @discount_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_campaigns/1
  # DELETE /discount_campaigns/1.json
  def destroy
    @discount_campaign.destroy
    respond_to do |format|
      format.html { redirect_to discount_campaigns_url, notice: 'Discount campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount_campaign
      @discount_campaign = DiscountCampaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_campaign_params
      params.require(:discount_campaign).permit(:name, :description, :discount_id, :product_id)
    end
end
