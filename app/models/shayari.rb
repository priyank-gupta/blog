class Shayari < ActiveRecord::Base
  
  acts_as_commentable
  
  CATEGORIES = ["Love","Hatred","Life","Loneliness","Joy"]
  
  DISPLAY_CATEGORIES = [["All Categories"],["Love"],["Hatred"],["Life"],["Loneliness"],["Joy"]]
  
  belongs_to :user
  
  #before_update :ensure_valid_user
  
  validates :title, :presence => true
  validates :body, :presence => true
  validates :category, :presence => true
  
  #private 
  
  #def ensure_valid_user
   # self.user_id === session[:user_id] 
  #end
  
end
