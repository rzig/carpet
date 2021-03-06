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
    david.rendered_about
  end
  test "it should convert text" do
    Person.delete_all
    david = Person.create(name: "david", about: "*genius programmer*")
    assert_equal "<p><em>genius programmer</em></p>\n", david.rendered_about
  end
  test "when specified, it should not render links" do
    Person.delete_all
    david = Person.create(name: "david", about: "[genius programmer](google.com)")
    assert_equal "<p>[genius programmer](google.com)</p>\n", david.rendered_about
  end
  test "the name of a person should have stars" do
    Person.delete_all
    david = Person.create(name: "david", about: "[genius programmer](google.com)")
    assert_equal "*david*", david.rendered_name
  end
  test "the method should be customiseable" do
    Person.delete_all
    david = Person.create(name: "david", about: "[genius programmer](google.com)")
    assert_equal "*david*", david.cool_name
  end
  test "multiple as values can be specified" do
    Person.delete_all
    david = Person.create(name: "david", about: "[genius programmer](google.com)")
    assert_equal david.rendered_name, david.cool_name
  end
end
