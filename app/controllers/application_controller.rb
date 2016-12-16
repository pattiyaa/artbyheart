class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :getArticlesImg,:getLastUpdate
  before_action :set_locale
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options
    { locale: I18n.locale }
  end
  def respond_modal_with(*args, &blk)
   options = args.extract_options!
   options[:responder] = ModalResponder
   respond_with *args, options, &blk
 end
 def getArticlesImg(admin_articles)
  
  admin_articles.each do |article|
   article.coverphoto = Admin::Photo.find_by( imageable_id: article.id,imageable_type: "article_cover")
 end

 return admin_articles
end
def getLastUpdate(updated_at)
  
  diff = (Time.zone.now - updated_at).to_i / 1.day 
  if diff > 0
   lastupdated = diff.to_s+' days'
 else
   diff = ((Time.zone.now - updated_at).to_i / 1.hour).round
   if diff > 0
    lastupdated = diff.to_s+' hours'
  else
    diff = ((Time.zone.now - updated_at).to_i / 360).round
    lastupdated = diff.to_s+' mins'
  end
end
return 'Last updated ' + lastupdated +' ago'
end
def split_base64(uri_str)
  if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
    uri = Hash.new
        uri[:type] = $1 # "image/gif"
        uri[:encoder] = $2 # "base64"
        uri[:data] = $3 # data string
        uri[:extension] = $1.split('/')[1] # "gif"
        return uri
      else
        return nil
      end
    end
  end
