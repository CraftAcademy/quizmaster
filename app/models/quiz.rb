class Quiz < ApplicationRecord
  validates_presence_of :name, :code
end
