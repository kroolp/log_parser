# frozen_string_literal: true

require 'bundler'

$APP_ROOT_PATH = File.dirname(__dir__)
$APP_ENV = ENV['APP_ENV'] || 'development'

$LOAD_PATH.push $APP_ROOT_PATH
Bundler.require(:default, $APP_ENV)