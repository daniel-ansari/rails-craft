require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @verified_user = users(:verified)
    @unverified_user = users(:unverified)
  end

  # Validations
  test "should be valid with valid attributes" do
    user = User.new(email: "validuser@mail.com", password: "123456")
    assert user.valid?
  end

  test "should require an email" do
    user = User.new(password: "123456")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "should require a unique email" do
    duplicate_user = @verified_user.dup
    assert_not duplicate_user.valid?
    assert_includes duplicate_user.errors[:email], "has already been taken"
  end

  test "should require a properly formatted email" do
    user = User.new(email: "invalid-email", password: "123456")
    assert_not user.valid?
    assert_includes user.errors[:email], "is invalid"
  end

  test "should require a password of minimum length" do
    user = User.new(email: "newuser@mail.com", password: "12345")
    assert_not user.valid?
    assert_includes user.errors[:password], "is too short (minimum is 6 characters)"
  end

  # Token Generation
  test "should generate email verification token" do
    token = @verified_user.signed_id(purpose: :email_verification, expires_in: 2.days)
    assert_not_nil token
    assert_equal @verified_user.email, User.find_signed(token, purpose: :email_verification).email
  end

  test "should generate password reset token" do
    token = @verified_user.signed_id(purpose: :password_reset, expires_in: 20.minutes)
    assert_not_nil token
    assert_equal @verified_user.password_salt.last(10), User.find_signed(token, purpose: :password_reset).password_salt.last(10)
  end

  # Callbacks
  test "should downcase and strip email before validation" do
    user = User.new(email: " Example@Mail.com ", password: "123456")
    user.validate
    assert_equal "example@mail.com", user.email
  end

  test "should set verified to false when email changes" do
    @verified_user.update(email: "newemail@mail.com")
    assert_not @verified_user.verified
  end
end
