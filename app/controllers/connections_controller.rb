class ConnectionsController < ApplicationController
  def index
    @primaries = Connection.where(:files_secondary_type_id => nil).page(params[:page]).per(10)
  end

  def create
    @pr = FilesPrimaryType.find params_con[:files_primary_type_id]
    @client = Client.find params_con[:client_id]
    if Connection.where(:files_primary_type_id => @pr.id, :files_secondary_type_id => nil, :client_id => @client.id).any?
      redirect_to :action => 'index'
      return
    else
      @con = Connection.new(:files_primary_type_id => @pr.id, :files_secondary_type_id => nil, :client_id => @client.id)
      @con.save
      @pr.files_secondary_types.each do |sc|
        @con = Connection.new(:files_primary_type_id => @pr.id, :files_secondary_type_id => sc.id, :client_id => @client.id)
        @con.save
      end
      redirect_to :action => 'index'
    end
  end

  def sc
    @connection = Connection.find params[:connection_id]
    @pr = @connection.files_primary_type
    arr =[]
    @pr.files_secondary_types.map{|sc| arr << sc.id}
    @secondary_files = Connection.where(:files_secondary_type_id => arr)
  end

  def sc_update
    @connection = Connection.find params[:connection_id]
    @client = @connection.client
    @primary_file = @connection.files_primary_type
    if (params[:do] == 'delete')
      Connection.where(:client_id => @client.id, :files_primary_type_id => @primary_file.id, :files_secondary_type_id => params[:secondary_id]).first.destroy
    else
      @con = Connection.new(:client_id => @client.id, :files_primary_type_id => @primary_file.id, :files_secondary_type_id => params[:secondary_id])
      @con.save
    end
    render :json => {}
  end

  def new
    @connection = Connection.new
  end

  def update
  end

  def destroy
    Connection.where(:id => params[:connection_id]).map{|c| c.destroy}
    redirect_to action: 'index'
  end

  private

  def params_con
    params.require(:connection).permit(:client_id, :files_primary_type_id, :connection_id, :id)
  end
end
