class PapersController < ApplicationController

  before_action :set_file

  def index
    @papers = @file.papers.page(params[:page]).per(10)
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)
    redirect_to action: 'index', :file_id => @file.id  if @paper.save
  end

  def delete
  end

  def destroy
    redirect_to action: 'index', :file_id => @file.id if Paper.find(params[:id]).destroy
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def update
    @paper = Paper.find(params[:id])
    redirect_to action: 'index', :file_id => @file.id if @paper.update(paper_params)
  end

  private

  def paper_params
    params.require(:paper).permit(:notes, :order, :url, :filer_id) if params.has_key? "paper"
  end
  def set_file
    @file = params.has_key?(:file_id) ? Filer.find(params[:file_id]) : Filer.find(paper_params[:filer_id])
  end
end
