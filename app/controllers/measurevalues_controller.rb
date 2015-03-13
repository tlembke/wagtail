class MeasurevaluesController < ApplicationController
  before_action :set_measurevalue, only: [:show, :edit, :update, :destroy]

  # GET /measurevalues
  # GET /measurevalues.json
  def index
    @measurevalues = Measurevalue.all
  end

  # GET /measurevalues/1
  # GET /measurevalues/1.json
  def show
  end

  # GET /measurevalues/new
  def new
    @measurevalue = Measurevalue.new
  end

  # GET /measurevalues/1/edit
  def edit
  end

  # POST /measurevalues
  # POST /measurevalues.json
  def create
    @measurevalue = Measurevalue.new(measurevalue_params)

    respond_to do |format|
      if @measurevalue.save
        format.html { redirect_to @measurevalue, notice: 'Measurevalue was successfully created.' }
        format.json { render :show, status: :created, location: @measurevalue }
      else
        format.html { render :new }
        format.json { render json: @measurevalue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurevalues/1
  # PATCH/PUT /measurevalues/1.json
  def update
    respond_to do |format|
      if @measurevalue.update(measurevalue_params)
        format.html { redirect_to @measurevalue, notice: 'Measurevalue was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurevalue }
      else
        format.html { render :edit }
        format.json { render json: @measurevalue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurevalues/1
  # DELETE /measurevalues/1.json
  def destroy
    @measurevalue.destroy
    respond_to do |format|
      format.html { redirect_to measurevalues_url, notice: 'Measurevalue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurevalue
      @measurevalue = Measurevalue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurevalue_params
      params.require(:measurevalue).permit(:person_id, :measure_id, :value, :value_date, :created_by)
    end
end
