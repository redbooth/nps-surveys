module NPSSurveys
  class Response < ActiveRecord::Base

    self.table_name = NPSSurveys.table_name

    validates :survey, presence: true
    validates :user_id, presence: true
  end
end
