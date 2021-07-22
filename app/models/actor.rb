class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def in_current_movie?(movie_id)
    self.movies.where(id: movie_id).count > 0
  end
  
end
