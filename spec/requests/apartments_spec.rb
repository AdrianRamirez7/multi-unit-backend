require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) {
    User.create(
      email: 'fake@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets all the apartments' do
      apartment = user.apartments.create(
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

      apartments = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartments.first['street']).to eq('124 Conch St')
    end
  end
    
  describe "POST /create" do 
    it "Saves a valid entry into the database" do
      apartment_params = {
        apartment: {
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
        }
      }

      post '/apartments', params: apartment_params
      apartment = JSON.parse(response.body)
      expect(apartment['state']).to eq 'CA'
      expect(response).to have_http_status(200)
    end
  end  
end
