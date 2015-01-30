* RAILS_ENV=production rake secret
    It will generate the secret key and then export SECRET_KEY_BASE = xxx

* Clean Precompile assets and regenerate
    RAILS_ENV=production bundle exec rake assets:clean assets:precompile
    RAILS_ENV=production bundle exec rake db:migrate

* Execute in dev|production machine
    bundle package

* Execute in production environment
    bundle install --deployment
---------------------------------
* ssh to the node
* cd /var/www
* choose the project to be updated and execute 'sudo git pull'
* sudo service apache2 restart

