class WorkshopsController < InheritedResources::Base

  private

    def workshop_params
      params.require(:workshop).permit(:title, :desctiption, :slung, :meta_description, :meta_keyworlds, :meta_title, :start, :finish, :capacity, :teacher_id, :available_on, :discontinue_on, :category_id, :price, :cost)
    end
end

