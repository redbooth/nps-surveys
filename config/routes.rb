NPSSurveys::Engine.routes.draw do
  namespace NPSSurveys.route_namespace, path: NPSSurveys.route_path do
    scope NPSSurveys.route_scope do
      resources :responses, only: [:index, :create]
    end
  end
end
