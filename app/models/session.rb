class Session < ActiveRecord::Base
  belongs_to :study_list
  belongs_to :user
  validates :time_studied, presence: true
  validates :date_completed, presence: true
end
