$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative '../lib/clinch_talent'
require 'faraday'
require 'json_api_client'
require 'mocha'
require 'minitest/autorun'
require 'mocha/minitest'
require 'json'
require 'webmock/minitest'
