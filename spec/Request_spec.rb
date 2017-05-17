
describe Request do

  before do
    let!(:userowner) do
      User.create(name: 'Bertie', email: 'Test.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:userrenter) do
      User.create(name: 'Tom', email: 'Tom.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:space) do
      Space.create(name: 'Flat', city: 'London', street: 'Comercial Street', postcode: 'E1 6LT', price: 72.06, description: "It's a flat mate", startDate: 15/05/ 2017, endDate: 19/05/2017, user_id: userowner.id)
    end

    let!(:request) do
      Request.create(startDateReq: 15/05/2017, endDateReq: 15/05/ 2017, confirmed: false, space_id: space.id, user_id: userrenter.id)
    end    
  end


  # it 'knows who owns the property for the request' do
  #   expect(request.space.user.name).to eq "Bertie"
  # end

  it 'knows who sent the request' do
    expect(request.user.name).to eq 'Tom'
  end
end
