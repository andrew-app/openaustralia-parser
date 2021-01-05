#!/usr/bin/env ruby

$:.unshift "#{File.dirname(__FILE__)}/../lib"

require 'test/unit'
require 'hansard_parser'
require 'hpricot'
require 'people'

class TestHansardParser < Test::Unit::TestCase
  def test_generic_speakers
    speech = HansardSpeech.new(Hpricot(''), "", "", "", "", nil)
    assert(HansardSpeech.generic_speaker?("Honourable member"))
    assert(HansardSpeech.generic_speaker?("Honourable members"))
    assert(HansardSpeech.generic_speaker?("Government member"))
    assert(HansardSpeech.generic_speaker?("Government members"))
    assert(HansardSpeech.generic_speaker?("Opposition member"))
    assert(HansardSpeech.generic_speaker?("Opposition members"))
    assert(HansardSpeech.generic_speaker?("a government member"))

    assert(!HansardSpeech.generic_speaker?("John Smith"))
  end
end
