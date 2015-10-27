class FilesController < ApplicationController

  def index
    @files = Filer.page(params[:page]).per(10)
  end

  def new
    @file = Filer.new
  end

  def create
    @file = Filer.new(file_params)
    redirect_to action: 'index' if @file.save
  end

  def delete
  end

  def show
    redirect_to action: 'index'
  end

  def destroy
    redirect_to action: 'index' if file = Filer.find(params[:id]).destroy
  end

  def edit
    @file = Filer.find(params[:id])
    @file.year = @file.year.year
  end

  def update
    @file = Filer.find(params[:id])
    redirect_to action: 'index' if @file.update(file_params)
  end

  def check_pr
    @pr = FilesPrimaryType.find params[:pr]
    render :json => {:type => @pr.yearly, :secondary => @pr.files_secondary_types.map{|sc| sc.serializable_hash}}
  end

  private

  def file_params
    pars = {}
    pars = params.require(:filer).permit(:name_en, :name_ar, :client_id, :files_secondary_types_id, :notes, :transaction_date, :year, :file_start_date, :file_end_date, :file_number)
    pars[:year] = Date.new(pars[:year].to_i)
    pars
  end
end
