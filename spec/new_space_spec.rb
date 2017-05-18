require 'web_helpers'


feature "User can create a new space" do
  scenario "A user can list a space" do
    sign_up
    expect { create_space }.to change { Space.all.count }.by 1
    expect(page).to have_current_path("/spaces")
  end
end
