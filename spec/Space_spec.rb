describe Space do

  let!(:user) do
    User.create(name: "Bertie", email: "Test.email@test.com", password: "Password1234", password_confirmation: "Password1234")
  end

  let!(:space) do
    Space.create(name: "Flat", city: "London", street: "Comercial Street", postcode: "E1 6LT", price: 72.06, description:"It's a flat mate", startDate: 15/05/2017, endDate: 19/05/2017, user_id: user.id)
  end

  it 'Knows its city' do
    expect(space.city).to eq "London"
  end

  it 'Knows the user it belongs to' do
    expect(space.user.name).to eq "Bertie"
  end
end
