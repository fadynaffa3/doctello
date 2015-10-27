class FilesSecondaryType < ActiveRecord::Base
  belongs_to :files_primary_type
  has_many :filers
end
