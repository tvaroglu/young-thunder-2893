require 'rails_helper'

RSpec.describe 'studio index' do
  # Story 1
    # Studio Index
    # As a user,
    # When I visit the studio index page
    # I see a each studio's name and location
    # And underneath each studio, I see the titles of all of its movies.
  it 'can list each studio and corresponding attributes' do
    universal = Studio.create!(
      name: 'Universal Studios',
      location: 'Hollywood')

    visit '/studios'
    # save_and_open_page

    expect(page).to have_content('All Studios')
    expect(page).to have_content("Studio Name: #{universal.name}")
    expect(page).to have_content("Studio Location: #{universal.location}")
  end

  it 'can list all movies associated with the studio' do
    universal = Studio.create!(
      name: 'Universal Studios',
      location: 'Hollywood')
    universal.movies.create!(
      title: 'Raiders of the Lost Ark',
      creation_year: 1981,
      genre: 'Action/Adventure')

    paramount = Studio.create!(
      name: 'Paramount Studios',
      location: 'Hollywood')
    paramount.movies.create!(
      title: 'The Terminator',
      creation_year: 1982,
      genre: 'Action/Adventure')

    visit '/studios'
    # save_and_open_page

    within "#studio-#{universal.id}" do
      expect(page).to have_content("All Movies:")
      expect(page).to have_content("Movie: #{universal.movies.all.first.title}")
      expect(page).to have_content("Year Created: #{universal.movies.all.first.creation_year}")
      expect(page).to have_content("Genre: #{universal.movies.all.first.genre}")
    end
    within "#studio-#{paramount.id}" do
      expect(page).to have_content("All Movies:")
      expect(page).to have_content("Movie: #{paramount.movies.all.first.title}")
      expect(page).to have_content("Year Created: #{paramount.movies.all.first.creation_year}")
      expect(page).to have_content("Genre: #{paramount.movies.all.first.genre}")
    end
  end

end
