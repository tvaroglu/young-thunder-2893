require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
  # movies belong to a studio
    it { should belong_to(:studio) }
  # movies can have many actors
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'instance methods' do
    it 'can return #average_actor_age' do
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

      actors.each { |actor| universal.movies.all.first.actors << actor }

      expect(universal.movies.all.first.average_actor_age).to eq(20)
    end
    it 'can return #actors_sorted_by_age' do
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

      actors.each { |actor| universal.movies.all.first.actors << actor }

      expected = universal.movies.all.first.actors_sorted_by_age

      expect(expected.length).to eq(2)
      expect(expected.first).to eq(actors.last)
      expect(expected.last).to eq(actors.first)
    end
  end

end
