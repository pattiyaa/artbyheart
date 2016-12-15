module GallaryHelper
  def gallery_for(images,cssclass) 
    Gallary.new(self, images,cssclass).html
  end
  class Gallary
    def initialize(view, images,cssclass)
      @view, @images, @cssclass = view, images, cssclass
      @uid = SecureRandom.hex(6)
    end
    def html
      content_tag(:div, slides, id: uid, class: @cssclass)
    end
    private
    attr_accessor :view, :images, :uid
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view
    def slides
      items = images.map.with_index { |image, index| slide_tag(image, index.zero?) }
      content_tag(:div, safe_join(items), class: 'card-columns')
    end

    def slide_tag(image, is_first)
    	$image= image_tag(image, :class => "card-img-top img-fluid")
      content_tag(:div, $image, class: 'card')
    end
   
  end
end
module ActiveAdmin
	module Views
		class IndexAsBlock
			def gallery_for(images,cssclass) 
				GallaryHelper::Gallary.new(self, images,cssclass).html
			end
		end
		
	end
end

