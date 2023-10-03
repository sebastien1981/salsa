class School < ApplicationRecord
  belongs_to :school, optional: true
  has_many :user_schools
  has_many :users, through: :user_schools
  has_many :school_classes

  validates :name,:address,:type_of_structure,:approval_number,:phone_number,:address_mail_pdt,:phone_number_pdt,  presence: true
end
