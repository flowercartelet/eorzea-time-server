require 'json'

class EorzeaTime < Sinatra::Base
  register Sinatra::Sprockets::Helpers
  set :sprockets, Sprockets::Environment.new(root)
  set :assets_prefix, '/assets'
  set :digest_assets, production?

  configure do
    %w/stylesheets javascripts images/.each do |dir|
      sprockets.append_path File.join root, 'assets', dir
    end
    sprockets.append_path Bootstrap.stylesheets_path
    sprockets.append_path Bootstrap.fonts_path
    sprockets.append_path Bootstrap.javascripts_path
    if Dir.exists? bower_directory = File.join(root, 'bower_components')
      Dir.entries(bower_directory).each do |basename|
        next if basename.start_with? '.'
        next unless Dir.exists? dir = File.join(bower_directory, basename)
        next unless File.exists? config_file = File.join(dir, 'bower.json')
        config = JSON.load File.open(config_file)
        files = config["main"]
        files = [files] unless files.is_a? Array
        files.map do |filename|
          File.join dir, File.dirname(filename)
        end.uniq.each do |assets_dir|
          sprockets.append_path assets_dir
        end
      end
    end
  end
  configure_sprockets_helpers do
  end

  configure :production do
    sprockets.js_compressor = :uglify
    sprockets.css_compressor = :scss
  end

  configure :development do
    register Sinatra::Reloader
  end

  helpers do
    def locale
      session[:locale] || 'en'
    end
  end

  get '/' do
    @time = Time.now
    @mode = 'analog'
    slim :index
  end

  get '/about' do
    slim :about
  end
end
