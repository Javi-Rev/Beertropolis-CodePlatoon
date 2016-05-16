require 'rails_helper'

def mock_authentication name, uid
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    'provider'    => 'twitter',
    'uid'         => uid,
    'info'        => {'name' => name},
    'credentials' => {'token' => 'test-token', 'secret' => 'test-secret'}
  })
end

def assert_signed_in
  assert page.has_content?('Log Out')
  refute page.has_content?('Log In')
end

def assert_signed_out
  refute page.has_content?('Log Out')
  assert page.has_content?('Log In')
end

feature "User authentication" do
  let(:name) {'Boo'}
  let(:uid) {'1234'}

  scenario "User is not signed in" do
    visit root_path
    assert_signed_out
  end

  scenario 'user can sign up with twitter' do
    mock_authentication name, uid
    visit root_path
    click_on 'Log In'
    user = User.first
    assert_signed_in
    expect(user.name).to eq name
    expect(user.uid).to eq uid
  end

  scenario 'user can sign in with twitter' do
    User.create!(uid: uid, name: name)
    mock_authentication name, uid
    visit root_path
    page.click_on 'Log In'
    assert_signed_in
    expect(User.count).to eq 1
  end

  scenario "User can sign out" do
    visit root_path
    click_on 'Log In'
    assert_signed_in
    click_on 'Log Out'
    assert_signed_out
  end

end



