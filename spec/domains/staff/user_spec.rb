require 'rails_helper'

RSpec.describe Staff::User, type: :model do
  describe 'build user' do
    context 'with default factory' do
      it 'expect to be valid' do
        expect(build(:staff_user)).to be_valid
      end
    end

    context 'with empty email' do
      it 'expect to be invalid' do
        expect(build(:staff_user, email: nil)).to_not be_valid
      end
    end
  end

  describe 'create user' do
    context 'with default factory' do
      it 'expect to be saved' do
        expect { create(:staff_user) }.to change { Staff::User::Model.count }.from(0).to(1)
      end
    end

    context 'with empty email' do
      it 'expect to not be saved' do
        expect { create(:staff_user, email: nil) }.to raise_error Sequel::ValidationFailed
      end
    end
  end
end
