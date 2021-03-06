# coding: utf-8

require_relative 'helper'
require 'fluent/formatter'
require 'fluent/plugin/formatter_pretty_json'

class PrettyJsonFormatterTest < ::Test::Unit::TestCase
  def setup
    @time = Fluent::Engine.now
  end

  def create_driver(conf={})
    Fluent::Test::FormatterTestDriver.new(Fluent::TextFormatter::PrettyJsonFormatter).configure(conf)
  end

  def configure(conf)
    @formatter = create_driver(conf)
  end

  def test_format
    configure({})
    tag = 'foo.bar'
    record = {"a" => "1", "b" => "2"}

    formatted = @formatter.format(tag, @time, record)
    assert_equal("{\n  \"a\": \"1\",\n  \"b\": \"2\"\n}\n", formatted)
  end
end
