class Paper < ActiveRecord::Base
  belongs_to :filer
  has_attached_file :url
  validates_attachment :url, :content_type => {
    :content_type => [
      "image/jpg", "image/jpeg", "image/png", "image/gif",
      "application/pdf", "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"] }, :size => { :in => 0..10.megabytes }
end
