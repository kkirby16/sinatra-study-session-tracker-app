class User < ActiveRecord::Base
  has_secure_password
  has_many :sessions
  has_many :study_lists, through: :sessions
end
