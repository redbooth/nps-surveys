module NpsSurveys
  class ResponseSerializer
    def initialize(response)
      @response = response
    end

    def to_json
      {
        id: @response.id,
        survey: @response.survey,
        feedback: @response.feedback,
        score: @response.score,
        user_id: @response.user_id,
        created_at: @response.created_at.to_i,
        updated_at: @response.updated_at.to_i
      }
    end
  end
end
