class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def average_actor_age
    self.actors.average(:age)
  end

  def actors_sorted_by_age
    self.actors.order(:age)
  end

end
