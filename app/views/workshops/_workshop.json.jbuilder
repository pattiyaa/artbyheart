json.extract! workshop, :id, :title, :desctiption, :slung, :meta_description, :meta_keyworlds, :meta_title, :start, :finish, :capacity, :teacher_id, :available_on, :discontinue_on, :category_id, :price, :cost, :created_at, :updated_at
json.url workshop_url(workshop, format: :json)