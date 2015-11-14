class FilesSecondaryTypesController < ApplicationController

  def index
    @files_secondary_types = FilesSecondaryType.page(params[:page]).per(10)
  end

  def new
    @files_secondary_type = FilesSecondaryType.new
  end

  def create
    @files_secondary_type = FilesSecondaryType.new(files_secondary_type_params)
    if @files_secondary_type.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def delete
  end

  def destroy
    redirect_to action: 'index' if files_secondary_type = FilesSecondaryType.find(params[:id]).destroy
  end

  def edit
    @files_secondary_type = FilesSecondaryType.find(params[:id])
  end

  def update
    @files_secondary_type = FilesSecondaryType.find(params[:id])
    redirect_to action: 'index' if @files_secondary_type.update(files_secondary_type_params)
  end

  private

  def files_secondary_type_params
    params.require(:files_secondary_type).permit(:name_en, :name_ar, :files_primary_type_id)
  end
end
