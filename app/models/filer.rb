class Filer < ActiveRecord::Base
  belongs_to :client
  belongs_to :files_secondary_type, :class_name => 'FilesSecondaryType', :foreign_key => :files_secondary_type_id, :primary_key => :id
  has_many   :papers
  validates_presence_of :name_en, :name_ar, :files_secondary_type_id, :client_id
  validates :filer_number, uniqueness: true
end
