describe Image do
  let!(:user) do
    User.create(name: 'Bertie', email: 'Test.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
  end

  let!(:space) do
    Space.create(name: 'Flat', city: 'London', street: 'Comercial Street', postcode: 'E1 6LT', price: 72.06, description: "It's a flat mate", startDate: Date.new(2001, 1, 2), endDate: Date.new(2001, 3, 4), user_id: user.id)
  end

  let!(:image) do
    Image.create(image_url: 'http://imgur.com/gallery/zTFW4', space_id: space.id)
  end

  it 'Has an ID' do
    expect(image.id).not_to be_nil
  end
end
