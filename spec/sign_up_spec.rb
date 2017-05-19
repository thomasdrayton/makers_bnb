feature 'User can sign up to Makers_BNB' do
  scenario 'A user signs up to Makers_BNB' do
    visit '/'
    expect { sign_up }.to change { User.all.count }.by 1
    user = User.last
    expect(user.password_encrypt).to_not eq('Password1234')
    expect(user.name).to eq('Bertie')
    expect(page).to have_current_path('/users/main')
  end
end
