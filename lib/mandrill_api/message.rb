module MandrillApi
  class Message < Base
    class << self
      def send_template(api_key, template, to_email, from_email, options={})
        template_name = template.class == String ? template : template.name
        required_options =  options.blank? ? {:template_content => [{:name => template.name, :content => template.name}],
                            :message => {:subject => template.name, :from_email => from_email, :to => [{
                            :email => to_email}]}} : options

        attributes = {:key => api_key, :template_name => template_name}.merge(required_options)
        post("send-template", attributes)
      end
    end
  end
end
