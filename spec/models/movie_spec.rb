require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
  # movies belong to a studio
    it { should belong_to(:studio) }
  # movies can have many actors
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end
  
end
