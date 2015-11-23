class TreeController < ApplicationController
  def index
    if params[:year].present?
      @year = params[:year]
    end
    @client_types = ClientType.all
  end
end
