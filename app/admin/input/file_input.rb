class FileInput < Formtastic::Inputs::FileInput
  def to_html
    input_wrapping do
      label_html <<
        builder.file_field(method, input_html_options) <<
        image_preview_content
    end
  end

  private

  def image_preview_content
    image_preview? ? image_preview_html : ""
  end

  def image_preview?
    # options[:image_preview] && @object.send(method).present?
    options[:image_preview]
  end
  def has_image?
    @object.send(method).present? || has_selectedimage?
  end
  def has_selectedimage?
    options[:image_selected].present? ? selected_img.present? : false
  end
  def selected_img
    @object.send(options[:image_selected])
  end
  def image_preview_html
    if has_image?
      if has_selectedimage?
        url =  selected_img.url
        style = "image-preview"
      else
        url = @object.send(method).url
        style = "image-preview"
      end
    else
       url=""
       style=""
    end
    template.content_tag(:div, :class => "image-preview fieldright") do
      template.image_tag(url,:id=>"image-preview", :class => "imp-thump "+style)
    end
  end

end