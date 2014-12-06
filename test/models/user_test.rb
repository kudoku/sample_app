require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "asdf", email: "asdf@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name too long?" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email too long?" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "emails that should be valid" do
    valid_emails = %w[user@gmail.com 2@a.c E_t-@foo.bar.org 
                    first.last@foo.jp]
    valid_emails.each do |valid_value|
      @user.email = valid_value
      assert @user.valid?, "#{valid_value} is valid"
    end
  end

  test "emails that are not valid" do
    invalid_emails = %w[asdf_gmail.com asdf@gmail,com asdf@gmail 
                        foo@bar_baz.com foo@bar+baz.com]
      invalid_emails.each do |invalid_value|
        @user.email = invalid_value
        assert_not @user.valid?, "#{invalid_value} is not valid"
      end
  end 

  test "unique email?" do
    not_unique_email = @user.dup
    not_unique_email.email = @user.email.downcase
    @user.save
    assert_not not_unique_email.valid?
  end                  



end