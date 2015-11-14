class FilesSecondaryType < ActiveRecord::Base
  belongs_to :files_primary_type
  has_many :filers
  has_many :connections
  validates_presence_of :name_en, :name_ar, :files_primary_type_id
end
