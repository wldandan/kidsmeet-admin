* How to run it in local development environment

    * Using ruby 2.0
    * Install mysql server
    * Install redis server
    * Make sure '/usr/sbin/sendmail' is available

    * bundle exec rake db:create
    * bundle exec rake db:migrate

    * To send email asynchronously by sidekiq, enviroment setup as follows, then sidekiq will monitor the scheduled jobs
        * start resids
        * `source env.sh`
        * `bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e production`
        * tail -f log/sidekiq.log
        * Check sidekiq by webiste /sidekiq

