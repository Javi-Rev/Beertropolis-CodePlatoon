require 'test_helper'

Rspec.describe AuthenticationTest < ActionDispatch::IntegrationTest
  def mock_authentication name, uid
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      'provider'    => 'twitter',
      'uid'         => uid,
      'info'        => {'name' => name},
      'credentials' => {'token' => 'test-token', 'secret' => 'test-secret'}
    })
  end

  def user_is_signed_in
    assert page.has_content?('Log Out')
    refute page.has_content?('Log In')
  end

  def user_is_signed_out
    refute page.has_content?('Log Out')
    assert page.has_content?('Log In')
  end

  example 'test_users_can_sign_in_with_twitter' do
    name = 'Boo'
    uid  = '1234'
    mock_authentication name, uid

    page.visit root_path
    user_is_signed_out
    expect(User.count) to equal 0

    page.click_on 'Log In'

    expect(User.count) to equal 1
    user_is_signed_in
    user = User.first
    expect(user.name) to equal name
    expect(user.uid) to equal uid

    page.click_on('Log Out')
    user_is_signed_out
  end

  def test_users_are_remembered_when_returning_to_the_site
    name = 'Boo'
    uid  = '1234'
    mock_authentication name, uid

    User.create!(uid: uid, name: name)
    page.visit root_path
    user_is_signed_out
    page.click_on 'Log In'
    assert_equal 1, User.count
    user_is_signed_in
    page.click_on 'Log Out'
    page.click_on 'Log In'
    assert_equal 1, User.count
  end
end
