class Connection < ActiveRecord::Base
  belongs_to :client
  belongs_to :files_primary_type
  belongs_to :files_secondary_type
end
