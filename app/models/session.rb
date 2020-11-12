class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :study_list
end
