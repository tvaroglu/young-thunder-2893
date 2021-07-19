class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    if params[:sort] == 'age'
      @actors = @movie.actors_sorted_by_age
    else
      @actors = @movie.actors.all
    end
  end

end
