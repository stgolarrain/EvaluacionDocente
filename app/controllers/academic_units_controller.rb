class AcademicUnitsController < ApplicationController
  before_action :set_academic_unit, only: [:show, :edit, :update, :destroy]

  # GET /academic_units
  # GET /academic_units.json
  def index
    @academic_units = AcademicUnit.all
  end

  # GET /academic_units/1
  # GET /academic_units/1.json
  def show
  end

  # GET /academic_units/new
  def new
    @academic_unit = AcademicUnit.new
  end

  # GET /academic_units/1/edit
  def edit
  end

  # POST /academic_units
  # POST /academic_units.json
  def create
    @academic_unit = AcademicUnit.new(academic_unit_params)

    respond_to do |format|
      if @academic_unit.save
        format.html { redirect_to @academic_unit, notice: 'Academic unit was successfully created.' }
        format.json { render :show, status: :created, location: @academic_unit }
      else
        format.html { render :new }
        format.json { render json: @academic_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_units/1
  # PATCH/PUT /academic_units/1.json
  def update
    respond_to do |format|
      if @academic_unit.update(academic_unit_params)
        format.html { redirect_to @academic_unit, notice: 'Academic unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_unit }
      else
        format.html { render :edit }
        format.json { render json: @academic_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_units/1
  # DELETE /academic_units/1.json
  def destroy
    @academic_unit.destroy
    respond_to do |format|
      format.html { redirect_to academic_units_url, notice: 'Academic unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_unit
      @academic_unit = AcademicUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_unit_params
      params.require(:academic_unit).permit(:name)
    end
end
