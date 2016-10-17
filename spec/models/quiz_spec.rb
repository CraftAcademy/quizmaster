require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :code }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :code }
  end

  describe 'Factory' do
    it 'should have a valid Factory' do
      expect(FactoryGirl.create(:quiz)).to be_valid
    end
  end

  describe 'Code' do
    let(:quiz) { FactoryGirl.create(:quiz) }
    it 'should not have more than 4 characters' do
      expect(quiz.code.length).to eq(4)
    end
  end
end
