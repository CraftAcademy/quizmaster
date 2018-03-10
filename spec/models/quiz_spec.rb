require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :code }
    it { is_expected.to have_db_column :is_started }
    it { is_expected.to have_many :questions }
    it { is_expected.to belong_to :user }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:code).is_equal_to(4) }
  end

  describe 'Factory' do
    it 'should have a valid Factory' do
      expect(create(:quiz)).to be_valid
    end
  end

  describe 'instance methods' do
    it 'should return true if quiz has been started' do
      quiz = create(:quiz)
      quiz.update_attribute(:is_started, true)
      expect(quiz.is_started?).to eq true
    end
  end
end
