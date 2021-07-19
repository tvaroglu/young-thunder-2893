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
    # save_and_open_page
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

  it 'can add actors to a movie' do
  # Story 3
  # Add an Actor to a Movie
    # As a user,
    # When I visit a movie show page,
    # I do not see any actors listed that are not part of the movie
    # And I see a form to add an actor to this movie
    # When I fill in the form with the name of an actor that exists in the database
    # And I click submit
    # Then I am redirected back to that movie's show page
    # And I see the actor's name is now listed
    # (You do not have to test for a sad path, for example if the name submitted is not an existing actor)
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

    visit "/movies/#{universal.movies.all.first.id}"
    # save_and_open_page

    expect(page).to have_content('Add Actors to Movie')
    expect(page).to have_button('Search Actors')
    expect(page).to_not have_content(actors.first.name)
    expect(page).to_not have_content(actors.first.age)

    fill_in 'Actor Name:', with: actors.first.name
    click_on('Search Actors')

    expect(current_path).to eq("/movies/#{universal.movies.all.first.id}/search")

    click_on("Add #{actors.first.name}")

    expect(current_path).to eq("/movies/#{universal.movies.all.first.id}")
    expect(page).to have_content(actors.first.name)
    expect(page).to have_content(actors.first.age)
  end

end
