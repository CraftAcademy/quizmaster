class Question < ApplicationRecord
  validates_presence_of :body, :answer, :quiz_id
  belongs_to :quiz
end
