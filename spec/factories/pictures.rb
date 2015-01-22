include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :picture, class: Ckeditor::Picture do
    data_file_name    {'test.jpg'}
    data              { fixture_file_upload Rails.root.to_s + '/spec/fixtures/files/test.jpg', 'img/jpeg' }
    data_content_type { 'image/jpeg' }
  end
end
