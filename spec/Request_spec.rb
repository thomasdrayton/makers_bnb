describe Request do
    let!(:userowner) do
      User.create(name: 'Bertie', email: 'Test.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:userrenter) do
      User.create(name: 'Tom', email: 'Tom.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:space) do
      Space.create(name: 'Flat', city: 'London', street: 'Comercial Street', postcode: 'E1 6LT', price: 72.06, description: "It's a flat mate", startDate: Date.new(2001,1,2), endDate: Date.new(2001,1,2), user_id: userowner.id)
    end

    let!(:request) do
      Request.create(startDateReq:Date.new(2001,1,2), endDateReq: Date.new(2001,1,2), confirmed: false, space_id: space.id, user_id: userrenter.id)
    end



  it 'knows who owns the property for the request' do
    p request.space
    expect(request.space.user.name).to eq "Bertie"
  end

  it 'knows who sent the request' do
    expect(request.user.name).to eq 'Tom'
  end
end
