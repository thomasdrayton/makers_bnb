describe User do
  let!(:user) do
    User.create(name: 'Bertie', email: 'Test.email@test.com', password: 'Password1234', password_confirmation: 'Password1234')
  end

  it 'Authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
  it 'Does not authenticate when given an incorrect Password' do
    expect(User.authenticate(user.email, 'Wrong Password')).to be_nil
  end

  it 'Has an ID' do
    expect(user.id).not_to be_nil
  end
end
