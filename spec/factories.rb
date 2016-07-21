require 'factory_girl'

FactoryGirl.define do
  sequence(:login) { |n| "gandhi_#{n}" }

  factory :user do
    login { generate(:login) }
    password 'dragons22'
  end
end
