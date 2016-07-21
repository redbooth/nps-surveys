require 'spec_helper'

module NpsSurveys
  describe ApiInternal::ResponsesController do
    include_context 'oauth authentication'

    routes { Engine.routes }

    describe '#index' do
      describe 'authentication', skip_db: true do
        it_behaves_like 'a oauth endpoint with scopes', [:all] do
          subject { :index }
        end
      end

      let!(:user_responses) do
        [
          Response.create(survey: 'hola1', user_id: user.id),
          Response.create(survey: 'hola2', user_id: user.id),
          Response.create(survey: 'hola3', user_id: user.id)
        ]
      end
      let!(:other_responses) do
        Response.create(survey: 'hola4', user_id: create(:user))
      end

      it 'returns all the responses associated by the logged in user' do
        login_as(user)

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
      describe 'authentication', skip_db: true do
        it_behaves_like 'a oauth endpoint with scopes', [:all] do
          let(:valid_params) { { survey: 'hola', score: 4 } }

          subject { :create }
        end
      end

      context 'stores the response in the DB and returns it in the HTTP response' do
        before { login_as(user) }

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
