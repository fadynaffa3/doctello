class TreeController < ApplicationController
  def index
    @client_types = ClientType.all
  end
end
