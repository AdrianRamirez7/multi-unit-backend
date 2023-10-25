user1 = User.where(email: 'flow@waters.com').first_or_create(password: 'password', 
password_confirmation: 'password')
user2 = User.where(email: 'flow@rivers.com').first_or_create(password: 'password', 
password_confirmation: 'password')

#create apartments

apt1 = [
    {
        street: '123 street',
        unit: 'A',
        city: 'Waters',
        state: 'CA',
        square_footage: 1000,
        price: '$3,000',
        bedrooms: 1,
        bathrooms: 0.5,
        pets: 'no'
    },
    {
        street: '123 street',
        unit: 'B',
        city: 'Waters',
        state: 'CA',
        square_footage: 1000,
        price: '$2,000',
        bedrooms: 1,
        bathrooms: 0.5,
        pets: 'yes'
    }
]

apt2 = [
    {
        street: 'ABC Blvd',
        unit: '1',
        city: 'Rivers',
        state: 'CA',
        square_footage: 1500,
        price: '$2,000',
        bedrooms: 1,
        bathrooms: 2,
        pets: 'no'
    },
    {
        street: '123 street',
        unit: '2',
        city: 'Rivers',
        state: 'CA',
        square_footage: 1000,
        price: '$2,000',
        bedrooms: 1,
        bathrooms: 0.5,
        pets: 'yes'
    }
]

apt1.each do |apartment| 
    user1.apartments.create(apartment)
    p "creating #{apartment}"
end

apt2.each do |apartment| 
    user2.apartments.create(apartment)
    p "creating #{apartment}"
end