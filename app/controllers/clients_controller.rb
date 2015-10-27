class ClientsController < ApplicationController

  def index
    @clients = Client.page(params[:page]).per(10)
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    redirect_to action: 'index' if @client.save
  end

  def delete
  end

  def show
    redirect_to action: 'index'
  end

  def destroy
    redirect_to action: 'index' if client = Client.find(params[:id]).destroy
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    redirect_to action: 'index' if @client.update(client_params)
  end

  private

  def client_params
    params.require(:client).permit(:name_en, :name_ar, :client_type_id, :registration_number, :client_date, :national_number, :income_tax_number, :sales_tax_number)
  end
end
