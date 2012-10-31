## CouchbaseSettings ##

Couchbase Server Settings in YAML for your Rails 3 app. Using patterns similar to the Yettings gem, it turns yaml into methods on the CouchbaseSettings module. 

## Required: Rails 3 and Ruby >= 1.9.2-p271 ##

## Install the gem ##

Add this to your Gemfile

```ruby
gem "couchbase-settings"
```


Install with Bundler

```bash
$ bundle install
``` 

## Adding the YAML file with your key/value pairs ##

Create a YAML file inside /your_rails_app/config called couchbase.yml

## Couchbase YAML file content ##

You can define key/value pairs in the YAML file and these will be available in your app.  You can set the defaults and any environment specific values.  
The file must contain each environment that you will use in your Rails app.  Here is a sample:

```yaml
defaults: &defaults
  server: 127.0.0.1
  servers:
    - 127.0.0.1
    - 127.0.0.2
     
  bucket: default
  password: 

development:
  <<: *defaults
  

test:
  <<: *defaults

production:
  <<: *defaults
```

## Accessing the values in your Rails app ##

```ruby
# Single Server IP
CouchbaseSettings.server  

# Server Cluster IP's (Array)
CouchbaseSettings.servers 

# Server Bucket Name
CouchbaseSettings.bucket

# Bucket Password, if set
CouchbaseSettings.password 
```

