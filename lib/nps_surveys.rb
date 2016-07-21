require 'foreigner'
require 'nps_surveys/engine'

module NpsSurveys
  mattr_accessor :controller_parent_class, :route_namespace, :route_path
end
