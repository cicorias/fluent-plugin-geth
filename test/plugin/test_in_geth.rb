require "helper"
require "fluent/plugin/in_geth.rb"

class GethInputTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    assert{ 1 }
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Input.new(Fluent::Plugin::GethInpudt).configure(conf)
  end
end
