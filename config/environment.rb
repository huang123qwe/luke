# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Luke::Application.initialize!

 # Maps asset types to public directory.
  ASSET_PUBLIC_DIRECTORIES = {
    audio:      '/audios',
    font:       '/fonts',
    image:      '/images',
    javascript: '/javascripts',
    stylesheet: '/stylesheets',
    video:      '/videos'
  }
