require 'image_optim'

Rails.application.config.middleware.use(
  Rack::Deflater,
  if: ->(_, _, headers, _) { headers['Content-Type']&.start_with?('image/') }
)

if Rails.env.production?
  Rails.application.config.middleware.use(
    ImageOptim::Middleware,
    cache: Rails.root.join('tmp', 'image_optim_cache'),
    skip_missing_workers: true,
    advpng: { level: 3 },
    gifsicle: { optimization_level: 3 },
    jpegoptim: { strip: ['all'], max_quality: 80 },
    jpegtran: {},
    optipng: { level: 3 },
    svgo: {}
  )
end
