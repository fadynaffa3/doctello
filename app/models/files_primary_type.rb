class FilesPrimaryType < ActiveRecord::Base
  has_many :files_secondary_types
  validates_presence_of :name_en, :name_ar
end
