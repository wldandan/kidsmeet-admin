Sidekiq.configure_server do |config|
  #config.redis = { url: ENV['REDISTOGO_URL'], namespace: 'my-app' }

  Rails.logger.info("init sidekiq configuration.")
  database_url = ENV['DATABASE_URL']
  sidekiq_concurrency = ENV['SIDEKIQ_CONCURRENCY'] || 25

  if database_url.blank?
    Rails.logger.info("Failed to detect the database url, please set ENVIRONMENT VARIABLE [DATABASE_URL]")
  else(database_url && sidekiq_concurrency)
    Rails.logger.info("init database_url.")
    Rails.logger.debug("Setting custom connection pool size of #{sidekiq_concurrency} for Sidekiq Server")

    ENV['DATABASE_URL'] = "#{database_url}?pool=#{sidekiq_concurrency}"
    Rails.logger.debug(%Q(DATABASE_URL => "#{ENV['DATABASE_URL']}"))

    ActiveRecord::Base.establish_connection
  end

  Rails.logger.info("Connection Pool size for Sidekiq Server is now: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
end