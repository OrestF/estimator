require 'rails_helper'

RSpec.describe Estimation::Task, type: :model do
  describe 'build task' do
    context 'with default factory' do
      it 'expect to be valid' do
        expect(build(:estimation_task)).to be_valid
      end
    end
  end
end
