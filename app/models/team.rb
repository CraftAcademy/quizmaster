class Team < ApplicationRecord
  validates_presence_of :name, :quiz_id

  belongs_to :quiz
end
