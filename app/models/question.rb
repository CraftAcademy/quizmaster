class Question < ApplicationRecord
  validates_presence_of :body, :answer
end
