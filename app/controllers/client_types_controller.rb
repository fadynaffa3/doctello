class ClientTypesController < ApplicationController

  def index
    @client_types = ClientType.page(params[:page]).per(10)
  end

  def new
    @client_type = ClientType.new
  end

  def create
    @client_type = ClientType.new(client_type_params)
    if @client_type.save
      redirect_to action: 'index'
    else
      @client_type.errors.each do |error|
        flash[:error] = error
      end
      render :new
    end

  end

  def delete
  end

  def show
    redirect_to action: 'index'
  end

  def destroy
    @client_type = ClientType.find(params[:id])
    if @client_type.clients.any?
      flash[:error] = 'Has Childs'
      redirect_to action: 'index'
    else
      redirect_to action: 'index' if @client_type.destroy
    end
  end

  def edit
    @client_type = ClientType.find(params[:id])
  end

  def update
    @client_type = ClientType.find(params[:id])
    redirect_to action: 'index' if @client_type.update(client_type_params)
  end

  private

  def client_type_params
    params.require(:client_type).permit(:name_en, :name_ar)
  end
end
