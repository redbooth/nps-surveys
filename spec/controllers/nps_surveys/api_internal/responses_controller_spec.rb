require 'spec_helper'

module NPSSurveys
  describe ApiInternal::ResponsesController do
    before(:each) do
      user = FactoryGirl.create(:user)
      NPSSurveys.current_user = lambda do
        user
      end
    end

    routes { Engine.routes }

    describe '#index' do
      let!(:user_responses) do
        %w{ hola1 hola2 hola3 }.map do |s|
          r = Response.new
          r.survey = s
          r.user_id = NPSSurveys.current_user.call.id
          r.save!
          r
        end
      end

      let!(:other_responses) do
        r = Response.new
        r.survey = 'hola4'
        r.user_id = FactoryGirl.create(:user).id
        r.save!
        r
      end

      it 'returns all the responses associated by the logged in user' do
        login_as(:user)

        get :index

        expect(parsed_json).to match [
          a_hash_including(
            user_responses[0].attributes.except('created_at', 'updated_at')
          ),
          a_hash_including(
            user_responses[1].attributes.except('created_at', 'updated_at')
          ),
          a_hash_including(
            user_responses[2].attributes.except('created_at', 'updated_at')
          )
        ]
      end
    end

    describe '#create' do

      context 'stores the response in the DB and returns it in the HTTP response' do

        context 'with valid parameters' do
          let(:valid_params) { { survey: 'hola', score: 4 } }

          before { post :create, valid_params }

          subject { response }

          its(:status) { is_expected.to eq(200) }

          it 'returns the created item as response body' do
            expect(parsed_json).to include(
              Response.last.attributes.except('created_at', 'updated_at')
            )
          end
        end

        context 'with invalid parameters' do
          let(:invalid_params) { { score: 4 } }

          before { post :create, invalid_params }

          subject { response }

          its(:status) { is_expected.to eq(422) }
        end
      end
    end
  end
end
