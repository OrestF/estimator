require 'rails_helper'

RSpec.describe Staff::Organization, type: :model do
  describe 'build organization' do
    context 'with default factory' do
      it 'expect to be valid' do
        expect(build(:staff_organization)).to be_valid
      end
    end
  end
end
