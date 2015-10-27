class FilesPrimaryType < ActiveRecord::Base
  has_many :files_secondary_types
end
