require "helper"

require 'fluent/test'
require 'fluent/test/helpers'
require 'fluent/test/log'
require 'fluent/test/driver/input'

require 'test/unit/rr'
require 'zlib'
require 'fileutils'


require "fluent/plugin/in_geth.rb"
require "logger"



  

class GethInputTest < Test::Unit::TestCase
  logger = Logger.new(STDOUT)
  logger.level = Logger::DEBUG

  setup do
    Fluent::Test.setup
    @time = event_time("2015-09-30 13:14:15 UTC")
    Fluent::Engine.now = @time
    if Fluent.const_defined?(:EventTime)
      stub(Fluent::EventTime).now { @time }
    end
  end

  CONFIG = %[
    aws_key_id test_key_id
    aws_sec_key test_sec_key
    s3_bucket test_bucket
    buffer_type memory
    <sqs>
      queue_name test_queue
    </sqs>
  ]

  test "success" do
    assert{ 1 }
  end

  test "create driver" do
    d = create_driver
    logger.debug("created driver")
    assert( d.nil?.! )

  end

  test "fail" do
    # flunk

  end

  test "run it" do
    d = create_driver

    d.run
  end

  test "emit it" do
    d = create_driver
    time = Fluent::Engine.now
    record = {"message"=>"body"}

    d.instance.emit(record, time)
  end



  private

  def create_driver(conf = CONFIG)
    Fluent::Test::Driver::Input.new(Fluent::Plugin::GethInput).configure(conf)
  end
end
