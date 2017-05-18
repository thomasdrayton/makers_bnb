require 'web_helpers'


feature "User can create a new space" do
  scenario "A user can list a space" do
    sign_up
    expect { create_space }.to change { Space.all.count }.by 1
    expect(page).to have_current_path("/spaces")
  end
  scenario "Spaces with an invalid postcode are not created" do
    sign_up
    expect { create_bad_space }.not_to change { Space.all.count }
    expect(page).to have_content("Please enter a valid UK Postcode")
    expect(page).to have_current_path("/spaces/new")
  end
end
