class User < ActiveRecord::Base
  has_secure_password
  has_many :study_lists
  has_many :sessions
  validates :username, uniqueness: true
  validates :username, presence: true
end

#has_secure_password also gives you access to the authenticate method.
