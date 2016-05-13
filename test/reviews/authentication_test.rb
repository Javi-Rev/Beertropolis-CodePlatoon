require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
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

  def test_users_can_sign_in_with_twitter
    name = 'Boo'
    uid  = '1234'
    mock_authentication name, uid

    page.visit root_path
    user_is_signed_out
    assert_equal 0, User.count

    page.click_on 'Log In'

    assert_equal 1, User.count
    user_is_signed_in
    user = User.first
    assert_equal name, user.name
    assert_equal uid, user.uid

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
