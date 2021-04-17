require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  make_my_diffs_pretty!

  setup do
    @zagreus = users(:zagreus)
  end

  test "welcome email is sent" do
    email = UserMailer.with(name: @zagreus.name, email: @zagreus.email).welcome_email
    assert_emails 1 do
      email.deliver_later
    end

    assert_equal email.to, [@zagreus.email]
    assert_equal email.from, ['hermes437637@yahoo.com']
    assert_equal email.subject, 'Welcome to HELL'
    assert_equal read_fixture("welcome_email.txt").join, email.text_part.body.to_s
    assert_equal read_fixture("welcome_email.html").join, email.html_part.body.to_s
  end
end
