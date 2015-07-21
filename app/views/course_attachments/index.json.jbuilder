json.array!(@course_attachments) do |course_attachment|
  json.extract! course_attachment, :id, :course_id, :video
  json.url course_attachment_url(course_attachment, format: :json)
end
