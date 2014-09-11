require 'bundler'
Bundler.require

require File.expand_path('../eorzea_time', __FILE__)

map '/assets' do
  run EorzeaTime.sprockets
end

map '/' do
  run EorzeaTime
end
