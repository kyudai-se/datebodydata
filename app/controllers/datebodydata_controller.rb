class DatebodydataController < ApplicationController
  before_action :set_datebodydatum, only: [:show, :edit, :update, :destroy]
  autocomplete :datebodydatum, :date, :full => true, :order => :date

  def auto_complete_for_datebodydatum_date
    find_options = {
      :conditions => [ "date LIKE ?", params[:datebodydatum][:date].downcase ],
      :order => :date
    }
    @datebodydata = Datebodydatum.find(:all, find_options)
    render :partial => 'auto_complete_for_date'
  end

  # GET /datebodydata
  # GET /datebodydata.json
  def index
    @datebodydata = Datebodydatum.order("date")
    require 'date'
    if !params[:date_search].blank?
      @start_day         = Date.parse(params[:date_search])
      @end_day           = @start_day + 6
      @categories        = @start_day.upto(@end_day).to_a
      tickInterval       = 1
      @data = @datebodydata.where(:date => @start_day...@end_day)
      data1 = @data.select(:weight).order("date").map{|d| d.weight.to_f}
      data2 = @data.select(:pulse).order("date").map{|d| d.pulse.to_f}
      data3 = @data.select(:bodytemperature).order("date").map{|d| d.bodytemperature.to_f}
      data4 = @data.select(:bloodpressure).order("date").map{|d| d.bloodpressure.to_i}
      data5 = @data.select(:highbloodpressure).order("date").map{|d| d.highbloodpressure.to_i}
      @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(text: 'グラフ名')
        f.xAxis(categories: @categories, tickInterval: tickInterval)
        f.options[:yAxis] = [
#yAxis: 0 or 指定なし
          { title: { text: '体重' }, min: 30, max: 130, tickInterval: 10},
#yAxis: 1
          { title: { text: '血圧' }, min: 50, max: 150, tickInterval: 10},
#yAxis: 2
          { title: { text: '脈拍' }, min: 50, max: 150, tickInterval: 10, opposite: true},
#yAxis: 3
          { title: { text: '体温' }, min: 35, max: 41, tickInterval: 0.5, opposite: true }
                            ]
        f.series(name: '体重', data: data1, type: 'column', yAxis: 0,
                 tooltip: { valueSuffix: 'Kg'},
#                 enableMouseTracking: false
                )
        f.series(name: '最低血圧', data: data4, type: 'column', yAxis: 1,
                 tooltip: { valueSuffix: 'mmHg'}
                )
        f.series(name: '最高血圧', data: data5, type: 'column', yAxis: 1,
                 tooltip: { valueSuffix: 'mmHg'}
                )
        f.series(name: '脈拍', data: data2, type: 'line', yAxis: 2,
                 tooltip: { valueSuffix: '回'}
                )
        f.series(name: '体温', data: data3, type: 'line', yAxis: 3,
                 tooltip: { valueSuffix: '°C'},
                 plotLines: [{ value: 0, width: 1, color: '#808080' }]
                )
        end
      else
        redirect_to root_path      
      end
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
        format.html { redirect_to datebodydatum_url(@datebodydatum, :date_search => params[:date_search]), notice: 'Datebodydatum was successfully created.' }
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
        format.html { redirect_to datebodydatum_url(@datebodydatum, :date_search => params[:date_search]), notice: 'Datebodydatum was successfully updated.' }
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
      format.html { redirect_to datebodydata_url(:date_search => params[:date_search]) }
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
      params.require(:datebodydatum).permit(
        :date, :weight, :pulse, :bodytemperature, :bloodpressure, :highbloodpressure, :date_search)
    end
end
