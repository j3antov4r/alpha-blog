class Article < ActiveRecord::Base
	belongs_to :user 
  #validaciones para BD
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  validates :user_id, presence: true 
end
