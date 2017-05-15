describe Space do
  let!(:space) do
    Space.create(name: "Flat", city: "London", street: "Comercial Street", postcode: "E1 6LT", price: 72.06, description:"It's a flat mate", startDate: 15/05/2017, endDate: 19/05/2017, user_id: user.id)
  end
end
