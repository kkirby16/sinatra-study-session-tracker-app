class User < ActiveRecord::Base
  has_secure_password #allows you to use bcrypt to hash and salt your passwords and save them in the database under a column called password_digest
  has_many :sessions
  has_many :study_lists, through: :sessions
end

#has_secure_password also gives you access to the authenticate method.
