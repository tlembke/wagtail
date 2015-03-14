class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @organisation=Organisation.new
    @provider = Provider.new
    @provider.organisation=@organisation
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
    if @provider.organisation_id==0
      @organisation = Organisation.new(organisation_params)
      @organisation.save
      @provider.organisation_id=@organisation.id
    end
    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update

    if params[:provider][:organisation_id]=='0'
      @organisation = Organisation.new(organisation_params)
      @organisation.save
      params[:provider][:organisation_id]=@organisation.id
    else
      @organisation = Organisation.find(params[:provider][:organisation_id])
      @organisation.update(organisation_params)
    end
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def newlocation
        @provider = Provider.find(params[:id])
        @organisation = Organisation.new
        @provider.organisation=@organisation

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:title,:family_name, :given_names, :organisation_id, :user_id, :craft_id)
    end
    def organisation_params
      params.require(:organisation).permit(:name,:address_line, :address_line_2, :town, :state, :postcode, :phone)
    end
end
