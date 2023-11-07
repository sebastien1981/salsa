class Teacher < ApplicationRecord
  has_many :teacher_dances, dependent: :destroy
  has_many :dances, through: :teacher_dances, dependent: :destroy
  has_many :school_teachers, dependent: :destroy
  has_many :schools, through: :school_teachers

  VALID_EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  validates :first_name, :last_name, :date_of_birth,:dance_ids, presence: true
  validates :address_mail, presence: true, format: { with: VALID_EMAIL_REGEX, multiline: true }
  #uniqueness:{case_sensetive:false},
  validates :phone_number, presence: true, length: { minimum: 10 }
end
