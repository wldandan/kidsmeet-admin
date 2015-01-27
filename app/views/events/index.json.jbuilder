json.array!(@events) do |event|
  json.extract! event, :id, :agent, :title, :category, :abstract, :content,
                       :brand_image_url, :start_time, :end_time, :contact_phone, :duration, :address
  json.url event_url(event, format: :json)
end
