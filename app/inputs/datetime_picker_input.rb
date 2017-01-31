class DatetimePickerInput 
  include Formtastic::Inputs::Base
    def to_html
      input_wrapping do
        label_html <<
        builder.datetime_picker(method, :class=>"fieldright") 
      end
    end
end