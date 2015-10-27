class Filer < ActiveRecord::Base
  belongs_to :client
  belongs_to :files_secondary_type
  has_many   :papers
end
