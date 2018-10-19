require 'rails_helper'

RSpec.describe Estimation::Project, type: :model do
  describe 'build project' do
    context 'with default factory' do
      it 'expect to be valid' do
        expect(build(:estimation_project)).to be_valid
      end
    end
  end
end
