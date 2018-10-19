require 'rails_helper'

RSpec.describe Estimation::Mark, type: :model do
  describe 'build mark' do
    context 'with default factory' do
      it 'expect to be valid' do
        expect(build(:estimation_mark)).to be_valid
      end
    end
  end
end
