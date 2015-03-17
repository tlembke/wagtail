class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_condition
      condition=Condition.find(params[:condition])
      @person = Person.find(params[:id])
      @person.conditions << condition
      respond_to do |format|
        format.js 
      end
  end

    def add_team_member
      @provider=Provider.find(params[:provider])
      @person = Person.find(params[:id])
      @new=!Team.exists?([@person.id,@provider.id])
      if @new
        @person.providers << @provider
      end
      @provider.family_name.blank? ? @name=@provider.organisation.name : @name=@provider.full_name


      
    end

    def remove_team_member
      @provider=params[:provider]
      @person = params[:id]
      if Team.exists?([@person,@provider])
          Team.find([@person.to_i,@provider.to_i]).delete
      end
      respond_to do |format|
        format.js { render json: nil, status: :ok}
      end
      


      
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:family_name, :given_names, :known_as, :address_line, :address_line_2, :town, :state, :postcode, :sex, :dob, :ihi, :dva, :phone, :created_by)
    end
end
