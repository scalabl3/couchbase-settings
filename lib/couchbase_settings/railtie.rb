require 'rails'
require 'couchbase_settings'

module CouchbaseSettings
  class Railtie < Rails::Railtie
    config.before_configuration do
      CouchbaseSettings.setup!
    end
  end
end
