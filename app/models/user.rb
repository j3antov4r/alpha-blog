class User < ActiveRecord::Base
	validates :username, 
		presence: true, 
		uniqueness: {case_sensitive: false},
		length: {minimun: 3, maximun: 25}
	VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
		presence: true,
		length: {maximun: 105},
		uniqueness: {case_sensitive: false},
		format: {with: VALID_EMAIL_REGEX}

end