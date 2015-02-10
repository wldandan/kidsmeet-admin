include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :picture, class: Ckeditor::Picture do
    data_file_name    { 'test.jpg' }
    data_content_type { 'image/jpeg' }
    data_file_size    { '368243' }
    data_updated_at   { Time.now }
  end
end
