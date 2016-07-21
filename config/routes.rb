NpsSurveys::Engine.routes.draw do
  namespace NpsSurveys.route_namespace, path: NpsSurveys.route_path do
    scope NpsSurveys.route_scope do
      resources :responses, only: [:index, :create]
    end
  end
end