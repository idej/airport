####AIRPORT

Simple application that imitate airport with one runway.

-----
Applicaion was written on ruby 2.2.2.

Dependencies:
  * MySQL
  * Redis

Steps to run the cloned application:
  1. Create you own config/database.yml file with db settings from config/database.yml.sample
  2. Execute `./bin/setup`
  3. Run redis server (usually `redis-server /usr/local/etc/redis.conf`)
  4. Run application with `foreman start`
  
Foreman run sidekiq, webworker and application servers.
