$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'nps_surveys/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'nps_surveys'
  s.version     = NpsSurveys::VERSION
  s.authors     = ['Redbooth team']
  s.email       = ['support@redbooth.com']
  s.summary     = 'Summary of NPS Surveys.'
  s.description = 'Surveys, like NPS.'

  s.files = Dir['{app,config,db,lib}/**/*']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails'
  s.add_dependency 'foreigner', '~> 1.7', '>= 1.7.4'
  s.add_development_dependency 'rspec-rails'
end
