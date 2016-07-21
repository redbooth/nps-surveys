module NpsSurveys
  module ApiInternal

    class ResponsesController < NpsSurveys.controller_parent_class
      def create
        response = create_survey_response

        return render json: ResponsePresenter.new(response).to_json if response.valid?

        raise AppException::UnprocessableEntity, response
      end

      def index
        responses = ::NpsSurveys::Response.where(user_id: current_user.id).map do |response|
          ResponsePresenter.new(response).to_json
        end

        render json: responses.to_json
      end

      private

      def create_survey_response
        ::NpsSurveys::Response.create(
          user_id: current_user.id,
          score: params[:score],
          feedback: params[:feedback],
          survey: params[:survey]
        )
      end
    end
  end
end
