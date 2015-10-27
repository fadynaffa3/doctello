class HomeController < ApplicationController
  def index
  end
  def setup
  end
  def switch
    I18n.locale = params[:locale]
    redirect_to action: 'index'
  end
end
