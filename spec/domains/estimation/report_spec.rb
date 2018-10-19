require 'rails_helper'

RSpec.describe Estimation::Report, type: :model do
  describe 'build report' do
    context 'with default factory' do
      it 'expect to be valid' do
        expect(build(:estimation_report)).to be_valid
      end
    end
  end
end
