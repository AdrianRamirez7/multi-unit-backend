require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) {User.create(
    email: 'fake@email.com',
    password: 'password1',
    password: 'password1',
    password_confirmation: 'password1'
  )}

  #apartment
  # let(:apartment) { user.apartments.create(
  #   street: '124 Conch St',
  #   unit: 'A',
  #   city: 'Bikini Bottom',
  #   state: 'CA',
  #   square_footage: 2000,
  #   price: '2000',
  #   bedrooms: 3,
  #   bathrooms: 2,
  #   pets: 'yes',
  #   image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
  # ) }
  describe "GET /index" do
    it 'returns all the apartments' do
      #http request
        apartment =  user.apartments.create(
    street: '124 Conch St',
    unit: 'A',
    city: 'Bikini Bottom',
    state: 'CA',
    square_footage: 2000,
    price: '2000',
    bedrooms: 3,
    bathrooms: 2,
    pets: 'yes',
    image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
  )

      get '/apartments'

      apartment = JSON.parse(response.body)
      p "apartment: ", apartment
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq '124 Conch St'
    end
  end
end
