require 'spec_helper'

describe NPSSurveys::Response do
  describe 'validations' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of(:survey) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
