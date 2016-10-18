class Quiz < ApplicationRecord
  validates_presence_of :name, :code
  validates_length_of :code, is: 4
  before_validation :generate_random_code
  has_many :questions

  private

  def generate_random_code
    if self.code.nil?
      self.code = [*('a'..'z'),*('0'..'9')].shuffle[0,4].join
    end
  end
end
