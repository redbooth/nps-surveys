module NPSSurveys
  class Response < ActiveRecord::Base
    self.table_name = 'surveys_responses'

    validates :survey, presence: true
    validates :user_id, presence: true
  end
end
