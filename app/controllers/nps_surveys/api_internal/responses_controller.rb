module NpsSurveys
  module ApiInternal

    class ResponsesController < NpsSurveys.controller_parent_class
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
        responses = ::NpsSurveys::Response.where(user_id: NpsSurveys.current_user.call.id).map do |response|
          ResponseSerializer.new(response).to_json
        end

        render json: responses.to_json
      end

      private

      def create_survey_response
        response = ::NpsSurveys::Response.new
        response.user_id = NpsSurveys.current_user.call.id
        response.score = params[:score],
        response.feedback = params[:feedback],
        response.survey = params[:survey]
        response.save
        response
      end
    end
  end
end
