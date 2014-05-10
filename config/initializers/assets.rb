Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'swf')
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( admin.js )