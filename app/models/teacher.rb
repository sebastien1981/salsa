class Teacher < ApplicationRecord
has_many :schools_class_teachers
has_many :schools_class, :through :schools_class_teachers 
end
