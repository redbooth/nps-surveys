NPSSurveys.controller_parent_class = ::ApplicationController
NPSSurveys.route_namespace = :api_internal
NPSSurveys.route_path = 'api/internal'
NPSSurveys.route_scope = 'nps_surveys'
NPSSurveys.current_user = lambda { |controller| controller.send(:current_user) }
