class FilesuploadInput < Formtastic::Inputs::FileInput
  def to_html
    input_wrapping do
      label_html <<
        file_html << input_value 
    end
  end

  private
  def file_html
    template.content_tag(:div, :class => "fieldright") do
      drop_area << builder.file_field(method,{:multiple => true, :class=> 'original'})<<
        output_content 
    end
  end
  def drop_area
     template.content_tag(:div, "Drop files here", :id => "drop_zone")
  end
  def output_content
    template.content_tag(:output, "", :id => "list") do
      selected_pictures.each_with_index.reduce('') { |c, (pic,index)| 
            c <<  template.content_tag(:div,:class => "thumb") do
                    template.content_tag(:a,:id=>"selectedfile_"+(index+1).to_s,:class => "remove pull-right",:href => "javascript:void(0)") do
                    template.content_tag(:i,"",:class=>"fa fa-times-circle")
                    end <<template.image_tag(pic.url, :class => "thumb")
                  end
          }.html_safe
    end
  end

  def input_value
    template.content_tag(:span, :id => "tempfiles", :style=>"display:none")  do
        selected_pictures.each_with_index.reduce('') { |c, (pic,index)| 
            c <<  builder.hidden_field(method,:multiple => true,:id=>"selectedfile_"+(index+1).to_s,:value => {'id': pic.id},:class=>"temp")
          }.html_safe
    end << template.hidden_field_tag("itemcount", selected_pictures.length)
  end
  def selected_pictures
    @object.send(method)
  end
end