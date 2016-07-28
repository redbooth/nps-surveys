module NPSSurveys
  module ApiInternal

    class ResponsesController < NPSSurveys.controller_parent_class
      def create
        response = create_survey_response

        return render json: ResponseSerializer.new(response).to_json if response.valid?

        render json: { error: {
                         message: 'Unprocessable Entity',
                         errors: response.try(:errors).try(:to_hash)
                       }
                     }, status:422
      end

      def index
        responses = ::NPSSurveys::Response.where(user_id: NPSSurveys.current_user.call.id).map do |response|
          ResponseSerializer.new(response).to_json
        end

        render json: responses.to_json
      end

      private

      def create_survey_response
        response = ::NPSSurveys::Response.new
        response.user_id = NPSSurveys.current_user.call.id
        response.score = params[:score],
        response.feedback = params[:feedback],
        response.survey = params[:survey]
        response.save
        response
      end
    end
  end
end
