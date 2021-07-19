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

    visit "/movies/#{universal.movies.first.id}"
    # save_and_open_page

    expect(page).to have_content("Movie Name: #{universal.movies.first.title}")
    expect(page).to have_content("Movie Name: #{universal.movies.first.creation_year}")
    expect(page).to have_content("Movie Name: #{universal.movies.first.genre}")
    expect(page).to_not have_content("Movie Name: #{universal.movies.last.title}")
    expect(page).to_not have_content("Movie Name: #{universal.movies.last.creation_year}")
    expect(page).to_not have_content("Movie Name: #{universal.movies.last.genre}")
  end

  xit 'can sort actors by age and return their average age' do
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

  # more stuff once DB schema is set up and re-migrated
  end


end
