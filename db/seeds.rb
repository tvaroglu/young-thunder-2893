MovieActor.destroy_all
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

# Studios
universal = Studio.create!(
  name: 'Universal Studios',
  location: 'Hollywood')

# Movies
universal.movies.create!(
  title: 'Raiders of the Lost Ark',
  creation_year: 1981,
  genre: 'Action/Adventure')
universal.movies.create!(title: 'Shrek',
  creation_year: 2001,
  genre: 'Comedy')

# Actors
actors = [
  Actor.create!(
    name: 'Bryan Cranston',
    age: 65),
  Actor.create!(
    name: 'James Franco',
    age: 43)
  ]

actors.each { |actor| universal.movies.all.first.actors << actor }
