CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAI4V7MAI7XCMTJSOA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'baobab-logic-lite'                     # required
end