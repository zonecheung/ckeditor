begin
  require "formtastic-bootstrap"

  class CkeditorInput < FormtasticBootstrap::Inputs::TextInput
    def to_html
      generic_input_wrapping do
        builder.cktext_area(method, input_html_options)
      end
    end
  end
rescue LoadError => e
  require "formtastic"

  class CkeditorInput
    include ::Formtastic::Inputs::Base
    
    def to_html
      input_wrapping do
        label_html <<
        builder.cktext_area(method, input_html_options)
      end
    end
  end
end

