class Client < ActiveRecord::Base
  belongs_to :client_type
  has_many :filers
  has_many :connections
  validates_presence_of :name_en, :name_ar, :client_type_id
end
