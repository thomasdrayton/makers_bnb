require 'date'
describe Request do

    let!(:tag) do
      Tag.create(name: 'Pool')
    end

    let!(:userowner) do
      User.create(name: 'Bertie', email: 'Test.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:userrenter) do
      User.create(name: 'Tom', email: 'Tom.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:space) do
      Space.create(name: 'Flat', city: 'London', street: 'Comercial Street', postcode: 'E1 6LT', price: 72.06, description: "It's a flat mate", startDate: Date.new(2001,1,2), endDate: Date.new(2001,3,4), user_id: userowner.id)
    end

    let!(:request) do
      Request.create(startDateReq: Date.new(2001,1,2), endDateReq: Date.new(2001,1,3), confirmed: false, space_id: space.id, user_id: userrenter.id)
    end

  it 'tag knows its relationship with space' do
    space.tags << tag
    expect(space.tags.length).to eq 1
  end

  it 'tag knows its relationship with space' do
    tag.spaces << space
    expect(tag.spaces.length).to eq 1
  end

  it 'has an ID' do
    expect(tag.id).not_to be_nil
  end

end
