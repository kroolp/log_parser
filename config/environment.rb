# frozen_string_literal: true

require 'bundler'

$APP_ROOT_PATH = File.dirname(__dir__)
$APP_ENV = ENV['APP_ENV'] || 'development'

$LOAD_PATH.push $APP_ROOT_PATH
Bundler.require(:default, $APP_ENV)

require 'app/reader/file_handler'
require 'app/reader/log_file'
require 'app/parser/parsed_logs_decorator'
require 'app/parser/logs'
require 'app/counter/total_views'
require 'app/counter/unique_views'
