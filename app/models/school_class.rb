class SchoolClass < ApplicationRecord
  belongs_to :school
  validate :check_dates
  validates :beginning_of_time, :end_of_time, presence: true
  validates :day_of_week, :level, :room_number, :teacher_name, :type_of_dance, presence: true
  validate :day_of_week_existing, :level_existing

private

def level_existing
  unless ['Débutant', 'Inter1', 'Inter2', 'Inter/Conf', 'Confirmé']
    errors.add(:level, notice: "must be a valid option")
  end
end
def day_of_week_existing
  unless ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi']
    errors.add(:day_of_week, notice: "must be a valid option")
  end
end

  def check_dates
    if (beginning_of_time > end_of_time) || (beginning_of_time == end_of_time)
      errors.add(:end_of_time, notice: "Ne peut pas être avant, ou égale à la date de début")
    end
  end
end
