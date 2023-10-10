class Teacher < ApplicationRecord
  has_and_belongs_to_many :dances
  validates :first_name, :last_name, :date_of_birth, :phone_number, :address_mail, :specialty, presence: true
end
