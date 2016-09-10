class User < ApplicationRecord
	has_many :posts
	has_attached_file :image, styles: {thumb: "150x150>" }, default_url: "/user/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
end
