require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "Example@email.com")
  end

  test "should be valid object" do  
    assert @user.valid?
  end
end