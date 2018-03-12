require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :body }
    it { is_expected.to belong_to :question }
    it { is_expected.to belong_to :team }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :question }
    it { is_expected.to validate_presence_of :team }
  end

  describe 'Factory' do
    it 'should have a valid Factory' do
      expect(create(:answer)).to be_valid
    end
  end
end
