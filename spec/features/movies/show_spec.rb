require 'rails_helper'

RSpec.describe 'movie show' do
  # Story 2
  # Movie Show
    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
  it 'can list a movie and corresponding attributes' do
    universal = Studio.create!(
      name: 'Universal Studios',
      location: 'Hollywood')
    universal.movies.create!(
      title: 'Raiders of the Lost Ark',
      creation_year: 1981,
      genre: 'Action/Adventure')
    universal.movies.create!(
      title: 'Shrek',
      creation_year: 2001,
      genre: 'Comedy')

    visit "/movies/#{universal.movies.all.first.id}"
    # save_and_open_page

    expect(page).to have_content("Movie: #{universal.movies.all.first.title}")
    expect(page).to have_content("Year Created: #{universal.movies.all.first.creation_year}")
    expect(page).to have_content("Genre: #{universal.movies.all.first.genre}")
    expect(page).to_not have_content("Movie: #{universal.movies.all.last.title}")
    expect(page).to_not have_content("Year Created: #{universal.movies.all.last.creation_year}")
    expect(page).to_not have_content("Genre: #{universal.movies.all.last.genre}")
  end

  it 'can sort actors by age and return their average age' do
    universal = Studio.create!(
      name: 'Universal Studios',
      location: 'Hollywood')
    universal.movies.create!(
      title: 'Raiders of the Lost Ark',
      creation_year: 1981,
      genre: 'Action/Adventure')

    actors = [
      Actor.create!(
        name: 'Bryan Cranston',
        age: 65),
      Actor.create!(
        name: 'James Franco',
        age: 43)
      ]
    actors.each { |actor| universal.movies.all.first.actors << actor }

    visit "/movies/#{universal.movies.all.first.id}"
    save_and_open_page
    expect(page).to have_content("All Actors - Average Age: #{universal.movies.all.first.average_actor_age}")

    within "#actor-#{universal.movies.all.first.actors.first.id}" do
      expect(page).to have_content("Name: #{universal.movies.all.first.actors.first.name}")
      expect(page).to have_content("Age: #{universal.movies.all.first.actors.first.age}")
    end
    within "#actor-#{universal.movies.all.first.actors.last.id}" do
      expect(page).to have_content("Name: #{universal.movies.all.first.actors.last.name}")
      expect(page).to have_content("Age: #{universal.movies.all.first.actors.last.age}")
    end

    click_on 'Sort Actors by Age'

    expect(actors.last.name).to appear_before(actors.first.name)
  end

end
