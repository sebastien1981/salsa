class Dance < ApplicationRecord
  has_many :teacher_dances
  has_many :teachers, through: :teacher_dances
end
