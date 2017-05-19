feature 'Request response' do

  scenario 'acceptance' do
    user_1 = { name: 'Peter', email: 'peter@mail.com', pass: 'asd123',  conf: 'asd123'}
    user_2 = { name: 'Paul', email: 'paul@mail.com', pass: 'asd123',  conf: 'asd123'}

    new_sign_up(user_1)
    create_successful_space
    new_log_out(user_1)
    new_sign_up(user_2)
    create_successful_request(user_2)
    new_log_out(user_2)
    new_sign_in(user_1)
    accept_request
  end

  scenario 'refusal' do
    user_1 = { name: 'Peter', email: 'peter@mail.com', pass: 'asd123',  conf: 'asd123'}
    user_2 = { name: 'Paul', email: 'paul@mail.com', pass: 'asd123',  conf: 'asd123'}

    new_sign_up(user_1)
    create_successful_space
    new_log_out(user_1)
    new_sign_up(user_2)
    create_successful_request(user_2)
    new_log_out(user_2)
    new_sign_in(user_1)
    decline_request
  end

end
