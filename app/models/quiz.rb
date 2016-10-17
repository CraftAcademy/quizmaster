class Quiz < ApplicationRecord
  validates_presence_of :name, :code
  before_save :generate_random_code

  private

  def generate_random_code
    self.code = [*('a'..'z'),*('0'..'9')].shuffle[0,4].join
  end
end
