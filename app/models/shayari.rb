class Shayari < ActiveRecord::Base
  
  CATEGORIES = ["Love","Hatred","Life","Loneliness","Joy"]
  
  belongs_to :user
  
  validates :title, :presence => true
  validates :body, :presence => true
  validates :category, :presence => true
  
end
