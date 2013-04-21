module MandrillApi
  class Template < Base
    class << self
      def list(api_key)
        find(:all, :from => "/api/1.0/templates/list.xml?key=#{api_key}")
      end
      def add(api_key, template_name, list_id)
        create(:from => "/api/1.0/templates/list.xml?key=#{api_key}&name=#{template_name}&code=#{list_id}")
      end
    end
  end
end
