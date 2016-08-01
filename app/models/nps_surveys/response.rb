module NPSSurveys
  class Response < ActiveRecord::Base
    validates :survey, presence: true
    validates :user_id, presence: true
  end
end
