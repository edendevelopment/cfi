AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3_KEY'] || 'thedefaultkey',
  :secret_access_key => ENV['S3_SECRET'] || 'thedefaultsecret'
)

