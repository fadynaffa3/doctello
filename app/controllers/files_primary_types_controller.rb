class FilesPrimaryTypesController < ApplicationController

  def index
    @files_primary_types = FilesPrimaryType.page(params[:page]).per(10)
  end

  def new
    @files_primary_type = FilesPrimaryType.new
  end

  def create
    @files_primary_type = FilesPrimaryType.new(files_primary_type_params)
    if @files_primary_type.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def delete
  end

  def destroy
    @files_primary_type = FilesPrimaryType.find(params[:id])
    if @files_primary_type.files_secondary_types.any?
      flash[:error] = 'Has Childs'
      redirect_to action: 'index'
    else
      redirect_to action: 'index' if @files_primary_type.destroy
    end
  end

  def edit
    @files_primary_type = FilesPrimaryType.find(params[:id])
  end

  def update
    @files_primary_type = FilesPrimaryType.find(params[:id])
    redirect_to action: 'index' if @files_primary_type.update(files_primary_type_params)
  end

  private

  def files_primary_type_params
    params.require(:files_primary_type).permit(:name_en, :name_ar, :yearly, :prefix)
  end
end
