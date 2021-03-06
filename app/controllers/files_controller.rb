class FilesController < ApplicationController

  def index
    @files = Filer.page(params[:page]).per(10)
  end

  def new
    @file = Filer.new
  end

  def create
    @file = Filer.new(file_params)
    count = Filer.where(:files_secondary_type => @file.files_secondary_type).where(:client_id => @file.client_id).count + 1
    @file.file_number = @file.client.prefix + "_" + @file.files_secondary_type.files_primary_type.prefix + "_" + @file.files_secondary_type.prefix + "_" + count.to_s
    if @file.save
      redirect_to new_paper_path(:file_id => @file.id)
    else
      render :new
    end
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
  end

  def update
    @file = Filer.find(params[:id])
    redirect_to action: 'index' if @file.update(file_params)
  end

  def check_pr
    @client = Client.find params[:client_id]
    @pr_arr = []
    Connection.where(:client_id => @client.id, :files_secondary_type_id => nil).map{|con| @pr_arr << con.files_primary_type_id}
    @pr = FilesPrimaryType.where(:id => @pr_arr)
    render :json => {:primary => @pr.map{|sc| sc.serializable_hash}}
  end

  def check_sc
    @client = Client.find params[:client_id]
    @pr = FilesPrimaryType.find params[:pr]
    @sc_arr = []
    Connection.where(:client_id => @client.id, :files_primary_type_id => @pr.id).where.not(:files_secondary_type => nil).map{|con| @sc_arr << con.files_secondary_type_id}
    @sc = FilesSecondaryType.where(:id => @sc_arr)

    render :json => {:type => @pr.yearly,:secondary => @sc.map{|scc| scc.serializable_hash}}
  end


  private

  def file_params
    pars = {}
    pars = params.require(:filer).permit(:name_en, :name_ar, :client_id, :files_secondary_type_id, :notes, :transaction_date, :file_number)
    pars
  end
end
