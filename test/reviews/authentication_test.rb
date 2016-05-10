require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  def test_users_can_sign_in_with_twitter
    name = 'Boo'
    uid  = '1234'
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      'provider'    => 'twitter',
      'uid'         => uid,
      'info'        => {'name' => name},
      'credentials' => {'token' => 'test-token', 'secret' => 'test-secret'}
    })

    page.visit root_path

    assert page.has_content?('Log In')
    refute page.has_content?('Log Out')
    assert_equal 0, User.count

    page.click_on 'Log In'

    assert_equal 1, User.count
    assert page.has_content?('Log Out')
    refute page.has_content?('Log In')
    user = User.first
    assert_equal name, user.name
    assert_equal uid, user.uid

    page.click_on('Log Out')

    assert page.has_content?('Log In')
    refute page.has_content?('Log Out')
  end

  def test_users_are_remembered_when_returning_to_the_site
    skip
    name = 'Boo'
    uid  = '1234'
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      'provider'    => 'twitter',
      'uid'         => uid,
      'info'        => {'name' => name},
      'credentials' => {'token' => 'test-token', 'secret' => 'test-secret'}
    })

    User.create(uid: uid, name: name)
    page.visit root_path

    page.click_on 'Log In'

    assert_equal 1, User.count

  end
end
