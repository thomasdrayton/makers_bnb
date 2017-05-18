require "uk_postcode"

describe Space do
  let!(:user) do
    User.create(name: 'Bertie', email: 'Test.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
  end

  let!(:space) do
    Space.create(name: 'Flat', city: 'London', street: 'Comercial Street', postcode: 'E1 6LT', price: 72.06, description: "It's a flat mate", startDate:Date.new(2001,1,2), endDate: Date.new(2001,1,2), user_id: user.id)
  end

  let!(:bad_space) do
    Space.create(name: 'Flat', city: 'London', street: 'Comercial Street', postcode: 'AGHHHHHHHHHH', price: 72.06, description: "It's a flat mate", startDate:Date.new(2001,1,2), endDate: Date.new(2001,1,2), user_id: user.id)
  end

  it 'Knows its city' do
    expect(space.city).to eq 'London'
  end

  it 'Knows its parent' do
    expect(space.user.name).to eq 'Bertie'
  end

  it 'Has an ID' do
    expect(space.id).not_to be_nil
  end

  it 'Knows the user it belongs to' do
    expect(space.user.name).to eq "Bertie"
  end

  it 'Checks that the postcode is valid' do
    postcode = UKPostcode.parse(space.postcode)
    expect(postcode.valid?).to be_truthy
  end

  it 'Checks that the postcode is invalid' do
    postcode = UKPostcode.parse(bad_space.postcode)
    expect(postcode.valid?).to be_falsy
  end

  it 'Can be read through user' do
    p user.spaces
    expect(user.spaces.length).to eq 1
  end


end
