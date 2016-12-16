module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
	def link_to_login_with(text, provider, url, html_options = {})
    add_default_class(html_options)
    convert_popup_attributes(html_options)

    link_to t(text, provider: provider), url, html_options
  end
  def nav_link(link_text, link_path) 
    class_name = current_page?(link_path) ? 'active' : ''
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
   end
  def locale_link(link_text, link_path,locale) 
    class_name = I18n.locale == locale ? 'active' : '' 
    content_tag(:li,link_to(link_text, link_path), :class => class_name)
  end
 

  private
  def add_default_class(html_options)
    default_class = "js-popup"

    if html_options.has_key?(:class)
      html_options[:class] << " " << default_class
    else
      html_options[:class] = default_class
    end
  end

  def convert_popup_attributes(html_options)
    width = html_options.delete(:width)
    height = html_options.delete(:height)

    if width && height
      html_options[:data] ||= {}
      html_options[:data].merge!({width: width, height: height})
    end
  end
end
