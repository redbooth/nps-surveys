require 'foreigner'
require 'nps_surveys/engine'

module NPSSurveys
  mattr_accessor :controller_parent_class, :route_namespace,
                 :route_path, :route_scope, :current_user, :table_name
end
