class WorkshopPhotosController < InheritedResources::Base

  private

    def workshop_photo_params
      params.require(:workshop_photo).permit(:workshop_id, :photo)
    end
end

