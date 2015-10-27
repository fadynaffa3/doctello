class ClientType < ActiveRecord::Base
  has_many :clients
  validates_presence_of :name_en, :name_ar
end
