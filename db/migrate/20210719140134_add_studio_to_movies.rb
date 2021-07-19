class AddStudioToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :studio, foreign_key: true
  end
end
