class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :team
  validates_presence_of :body, :question, :team
end
