class DatebodydataController < ApplicationController
  before_action :set_datebodydatum, only: [:show, :edit, :update, :destroy]

  # GET /datebodydata
  # GET /datebodydata.json
  def index 
    @datebodydata = Datebodydatum.order("date ASC")
    @graphdata = Datebodydatum.order('date ASC').group(:date).sum(:weight)
    @chartdata = Datebodydatum.order('date ASC').group(:date).sum(:pulse)
  end

  # GET /datebodydata/1
  # GET /datebodydata/1.json
  def show
  end

  # GET /datebodydata/new
  def new
    @datebodydatum = Datebodydatum.new
  end

  # GET /datebodydata/1/edit
  def edit
  end

  # POST /datebodydata
  # POST /datebodydata.json
  def create
    @datebodydatum = Datebodydatum.new(datebodydatum_params)
    @datebodydatum.weight = @datebodydatum.weight.round(1)
    respond_to do |format|
      if @datebodydatum.save
        format.html { redirect_to @datebodydatum, notice: 'Datebodydatum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @datebodydatum }
      else
        format.html { render action: 'new' }
        format.json { render json: @datebodydatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datebodydata/1
  # PATCH/PUT /datebodydata/1.json
  def update
    @datebodydatum.weight = @datebodydatum.weight.round(1)
    respond_to do |format|
      if @datebodydatum.update(datebodydatum_params)
        format.html { redirect_to @datebodydatum, notice: 'Datebodydatum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @datebodydatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datebodydata/1
  # DELETE /datebodydata/1.json
  def destroy
    @datebodydatum.destroy
    respond_to do |format|
      format.html { redirect_to datebodydata_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datebodydatum
      @datebodydatum = Datebodydatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datebodydatum_params
      params.require(:datebodydatum).permit(:date, :weight, :pulse)
    end
end
