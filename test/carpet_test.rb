require 'test_helper'

class Carpet::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Carpet
  end
  test "make sure it is a module" do
    assert_kind_of Module, Carpet::RedcarpetField
  end
  test "it should be called in the model" do
    Person.delete_all
    david = Person.create(name: "david", about: "genius programmer")
    david.parsed_about
  end
  test "it should convert text" do
    Person.delete_all
    david = Person.create(name: "david", about: "*genius programmer*")
    assert_equal "<p><em>genius programmer</em></p>\n", david.parsed_about
  end
  test "when specified, it should not render links" do
    Person.delete_all
    david = Person.create(name: david, about: "[genius programmer](google.com)")
    assert_equal "<p>[genius programmer](google.com)</p>\n", david.parsed_about
  end
end
