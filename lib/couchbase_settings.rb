require 'rails'
require 'yaml'
require 'erb'
require "couchbase_settings/version"

module CouchbaseSettings
  class UndefinedCouchbaseSettings < StandardError; end
  class << self
    def setup!
      find_ymls.each do |yml|
        create_cbsettings_class(yml)
      end
    end
  
    def find_ymls
      main_file = "#{Rails.root.to_s}/config/couchbase.yml"
      couchbase_main_file = File.exists?(main_file) ? [main_file] : []
      couchbase_main_file
    end
  
    def create_cbsettings_class(yml_file)
      hash = load_yml(yml_file)
      #klass_name = File.basename(yml_file).gsub(".yml","").camelize
      klass_name = "CouchbaseSetting"
      #klass_name = "#{klass_name}CouchbaseSetting" unless klass_name=="CouchbaseSetting"
      klass = Object.const_set(klass_name,Class.new)
      hash.each do |key,value|
        #Rails.logger.debug "hash: key = #{key}, value = #{value}"
        klass.define_singleton_method(key){ value }
      end
      
      # add a method to inspect the entire yml hash
      klass.define_singleton_method("inspect") { hash }
      
      klass.class_eval do
        def self.method_missing(method_id,*args)
          raise UndefinedCouchbaseSettings, "#{method_id} is not defined in #{self.to_s}"
        end
      end
    end
  
    def load_yml(yml_file)
      erb = ERB.new(File.read(yml_file)).result
      erb.present? ? YAML.load(erb).to_hash[Rails.env] : {}
    end
  end # class << self
end

# Include Railtie after defining the module
COUCHBASE_SETTINGS_PATH = "#{File.dirname(__FILE__)}/couchbase_settings"
require "#{COUCHBASE_SETTINGS_PATH}/railtie.rb"
