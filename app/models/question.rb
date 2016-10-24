class Question < ApplicationRecord
  validates_presence_of :body, :answer, :quiz_id
  belongs_to :quiz
  has_many :answers

  def is_sent?
    self.is_sent
  end

end
