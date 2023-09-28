class School < ApplicationRecord
  belongs_to :school, optional: true
  has_many :user_schools
  has_many :users, through: :user_schools
  has_many :school_classes
end
