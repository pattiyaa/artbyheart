json.extract! workshop_photo, :id, :workshop_id, :photo, :created_at, :updated_at
json.url workshop_photo_url(workshop_photo, format: :json)