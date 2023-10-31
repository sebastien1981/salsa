class School < ApplicationRecord
  belongs_to :school, optional: true
  has_many :user_schools
  has_many :users, through: :user_schools
  has_many :school_classes
  has_many :school_teachers
  has_many :teachers, through: :school_teachers

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :name,:address,:type_of_structure,:approval_number,:phone_number,:address_mail_pdt,:phone_number_pdt,:number_room, presence: true
  validates :number_room, numericality: { only_integer: true,greater_than_or_equal_to: 1 }
  validates :address_mail_pdt , presence: true,format:{with:VALID_EMAIL_REGEX,multiline:true}
  #uniqueness:{case_sensetive:false},
  validates :phone_number,:phone_number_pdt, length: { minimum: 10 }
end
