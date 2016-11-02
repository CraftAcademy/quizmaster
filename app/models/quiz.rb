class Quiz < ApplicationRecord
  validates_presence_of :name, :code
  validates_length_of :code, is: 4
  before_validation :generate_random_code
  has_many :questions
  has_many :teams
  belongs_to :user

  #accepts_nested_attributes_for :questions


  def get_scores
    scores = []
    self.teams.each do |team|
      points = team.answers.where(is_correct: true).count
      scores << {team: team, score: points}
    end
    scores.sort_by! {|team| team[:score]}
  end

  def reset_quiz_actions
    self.update_attribute(:is_started, false)
    self.questions.each do |question|
      question.update_attribute(:is_sent, false)
      question.answers.destroy_all
    end
  end

  def is_started?
    self.is_started
  end

  private

  def generate_random_code
    if self.code.nil?
      self.code = [*('a'..'z'),*('0'..'9')].shuffle[0,4].join
    end
  end
end
