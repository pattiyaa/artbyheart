class ToggleswitchInput 
  include Formtastic::Inputs::Base

  def to_html
    # Add your custom input definition here.
     @uid = SecureRandom.hex(6)
    input_wrapping do
      label_html <<
        template.content_tag(:div,checkbox_html,class: "fieldright")
    end
  end
  def unchecked_value
    options[:unchecked_value] || ''
  end
  def selected_values
    @selected_values ||= make_selected_values
  end
  private
  def checkbox_html 
    template.content_tag(:div, :class => "onoffswitch") do
      original_checkbox << toggleskin
    end
  end
  def original_checkbox
    builder.check_box(method,:class=> "onoffswitch-checkbox",:id => 'toggle_'+ @uid) 
    # template.content_tag(:input,"",:type => "checkbox",:class=> "onoffswitch-checkbox",:id => 'toggle_'+ @uid)
  end
  def toggleskin
    template.content_tag(:lable, :class => "onoffswitch-label ", :for => 'toggle_'+ @uid) do
          template.content_tag(:div,"", :class=>"onoffswitch-inner") << template.content_tag(:span,"", :class=>"onoffswitch-switch")
      end
  end
end