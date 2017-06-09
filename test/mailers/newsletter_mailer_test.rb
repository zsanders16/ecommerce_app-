require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "weekly" do
    mail = NewsletterMailer.weekly
    assert_equal "Weekly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "monthly" do
    mail = NewsletterMailer.monthly
    assert_equal "Monthly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "yearly" do
    mail = NewsletterMailer.yearly
    assert_equal "Yearly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
