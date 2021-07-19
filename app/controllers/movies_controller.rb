class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    if params[:sort] == 'age'
      @actors = @movie.actors_sorted_by_age
    else
      @actors = @movie.actors.all
    end
  end

  def search_actors
    @movie = Movie.find(params[:id])
    @actors = Actor.search(params[:search])
  end

  def add_actor
    @movie = Movie.find(params[:id])
    @actor = Actor.find(params[:actor_id])
    @movie.actors << @actor
    redirect_to "/movies/#{@movie.id}"
  end

end
