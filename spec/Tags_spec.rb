require 'date'
describe Tag do

    let!(:tag) do
      Tag.create(pool: true, terrace: true, studio: false, wifi: false, aircon: false, appartment: false, close_to_beach: false, balcony: false)
    end

    let!(:userowner) do
      User.create(name: 'Bertie', email: 'Test.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:userrenter) do
      User.create(name: 'Tom', email: 'Tom.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
    end

    let!(:space) do
      Space.create(name: 'Flat', city: 'London', street: 'Comercial Street', postcode: 'E1 6LT', price: 72.06, description: "It's a flat mate", startDate: Date.new(2001,1,2), endDate: Date.new(2001,3,4), user_id: userowner.id, tag: tag)
    end

    let!(:request) do
      Request.create(startDateReq: Date.new(2001,1,2), endDateReq: Date.new(2001,1,3), confirmed: false, space_id: space.id, user_id: userrenter.id)
    end

  it 'tag knows its relationship with space' do
    p space.tag
    expect(space.tag.terrace).to eq true
    expect(space.tag.pool).to eq true
    expect(space.tag.studio).to eq false
  end


  it 'has an ID' do
    expect(tag.id).not_to be_nil
  end

  it

end
