#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require_relative '../config/environment'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: parser.rb [options]'

  opts.on('--data-type=TYPE',
          'Select data type: [ total_views | unique_views ], default: total_views') do |value|
    options[:data_type] = value
  end
end.parse!

options[:data_type] ||= 'total_views'

raise "File path can't be empty" unless ARGV[0]

Processor.new(options[:data_type]).call(ARGV[0])
