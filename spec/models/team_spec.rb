require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :is_winner }
    it { is_expected.to belong_to :quiz }
    it { is_expected.to have_many :answers }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :quiz_id }
  end

  describe 'Factory' do
    it 'should have a valid Factory' do
      expect(create(:team)).to be_valid
    end
  end
end
