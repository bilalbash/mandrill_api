require 'active_resource'

module MandrillApi
  class Base < ActiveResource::Base
    def self.connect_mandrill(current_site)
      old_site = site
      begin
        self.site = current_site
        connection(:refresh => true)
        yield
      ensure
        self.site = old_site
      end
    end

    protected

    # Fix for ActiveResource 3.1+ errors
    self.format = :xml

    def self.instantiate_collection(collection, prefix_options = {})
      if collection.class == String
        return collection
      end
      collection.collect! { |record| instantiate_record(record, prefix_options) }
    end

    # Dynamic finder for attributes
    def self.method_missing(method, *args)
      if method.to_s =~ /^find_(all_)?by_([_a-zA-Z]\w*)$/
        raise ArgumentError, "Dynamic finder method must take an argument." if args.empty?
        options = args.extract_options!
        resources = respond_to?(:find_all_across_pages) ? send(:find_all_across_pages, options) : send(:find, :all)
        resources.send($1 == 'all_' ? 'select' : 'detect') { |container| container.send($2) == args.first }
      else
        super
      end
    end
  end
end
