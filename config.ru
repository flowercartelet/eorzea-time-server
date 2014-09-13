require 'bundler'
Bundler.require

$:.unshift File.expand_path('../lib', __FILE__)
require 'eorzea_time'

map '/assets' do
  run EorzeaTime.sprockets
end

map '/' do
  run EorzeaTime
end
