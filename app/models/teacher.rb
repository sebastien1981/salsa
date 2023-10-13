class Teacher < ApplicationRecord
  has_many :teacher_dances, dependent: :destroy
  has_many :dances, through: :teacher_dances
  validates :first_name, :last_name, :date_of_birth, :phone_number, :address_mail, :specialty, presence: true
end
