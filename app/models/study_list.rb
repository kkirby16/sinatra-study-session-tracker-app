class StudyList < ActiveRecord::Base
  belongs_to :user
  has_many :sessions
  validates :topic, presence: true
  validates_uniqueness_of :topic, scope: :user_id
end
