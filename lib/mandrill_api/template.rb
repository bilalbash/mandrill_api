module MandrillApi
  class Template < Base
    class << self
      def list(api_key)
        find(:all, :from => "/api/1.0/templates/list.xml?key=#{api_key}")
      end
      def add(api_key)
        create(:from => "/api/1.0/templates/list.xml?key=#{api_key}&name=#{'my_first_temp'}&code=#{'321fsaew21'}")
      end
    end
  end
end
