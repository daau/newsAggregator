class User < ApplicationRecord
	has_secure_password

	has_many :posts
	accepts_nested_attributes_for :posts, allow_destroy: true
	validates :email, presence: true, uniqueness: true
end
