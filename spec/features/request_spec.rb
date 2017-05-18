require_relative '../web_helpers'

feature 'Request creation' do

  scenario 'successfully' do
    user_1 = { name: 'Peter', email: 'peter@mail.com', pass: 'asd123',  conf: 'asd123'}
    user_2 = { name: 'Paul', email: 'paul@mail.com', pass: 'asd123',  conf: 'asd123'}

    new_sign_up(user_1)
    create_successful_space
    create_successful_request(user_1)
  end

  scenario 'unsuccessfully' do
    user_1 = { name: 'Peter', email: 'peter@mail.com', pass: 'asd123',  conf: 'asd123'}
    user_2 = { name: 'Paul', email: 'paul@mail.com', pass: 'asd123',  conf: 'asd123'}

    new_sign_up(user_1)
    create_successful_space
    create_unsuccessful_request(user_1)
  end

end
