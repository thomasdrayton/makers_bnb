feature "User can confirm requests for their properties" do
  scenario 'A user can see their requests' do
    user_1 = { name: 'Peter', email: 'peter@mail.com', pass: 'asd123', conf: 'asd123' }
    user_2 = { name: 'Paul', email: 'paul@mail.com', pass: 'asd123', conf: 'asd123' }
    new_sign_up(user_1)
    create_successful_space
    sign_out
    new_sign_up(user_2)
    create_successful_request(user_2)
    sign_out
    sign_in(user_1)
    expect(page).to have_current_path('/users/main')
    expect(page).to have_content("Number of bookings(1)")
    click_link('Number of bookings(1)')
    expect(page).to have_content("Paul sent a request for Flat in London")
  end
end
