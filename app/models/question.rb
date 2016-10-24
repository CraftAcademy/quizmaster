class Question < ApplicationRecord
  validates_presence_of :body, :answer, :quiz_id
  belongs_to :quiz
  has_many :answers

  def is_sent?
    if self.is_sent == true
      true
    else
      false
    end
  end
end
