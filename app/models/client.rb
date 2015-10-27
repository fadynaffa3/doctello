class Client < ActiveRecord::Base
  belongs_to :client_type
  has_many :filers
end
