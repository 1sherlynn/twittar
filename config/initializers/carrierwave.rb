CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["S3_KEY"],        # required
    aws_secret_access_key: ENV["S3_SECRET"], 
    region: 			   ENV["S3_REGION"]       # required
  }
  config.fog_directory  = ENV["S3_BUCKET"]   
  config.fog_public     = false             # required
end