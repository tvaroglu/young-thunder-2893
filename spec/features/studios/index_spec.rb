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

end
