require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
  # actors can be in many movies
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe 'instance methods' do
    it 'can return if an actor is #in_current_movie?' do
      universal = Studio.create!(
        name: 'Universal Studios',
        location: 'Hollywood')
      universal.movies.create!(
        title: 'Raiders of the Lost Ark',
        creation_year: 1981,
        genre: 'Action/Adventure')

      actors = [
        Actor.create!(
          name: 'Actor 1',
          age: 30),
        Actor.create!(
          name: 'Actor 2',
          age: 10)
        ]

      expect(actors.first.in_current_movie?(universal.movies.all.first.id)).to be false

      universal.movies.all.first.actors << actors.first

      expect(actors.first.in_current_movie?(universal.movies.all.first.id)).to be true
    end
  end

  describe 'class methods' do
    it 'can #search for actors to add to a movie' do
      universal = Studio.create!(
        name: 'Universal Studios',
        location: 'Hollywood')
      universal.movies.create!(
        title: 'Raiders of the Lost Ark',
        creation_year: 1981,
        genre: 'Action/Adventure')

      actors = [
        Actor.create!(
          name: 'Actor 1',
          age: 30),
        Actor.create!(
          name: 'Actor 2',
          age: 10)
        ]

      expect(Actor.search('actor 1')).to eq([actors.first])
    end
  end

end
