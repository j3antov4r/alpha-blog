class Article < ActiveRecord::Base
  #validaciones para BD
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 120}
end
