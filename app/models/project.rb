class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    contestants.count
  end

  def avg_experience
    total = 0.0
    contestants.each do |contestant|
      total += contestant.years_of_experience
    end
    avg = (total / contestant_count).round(2)
  end
end