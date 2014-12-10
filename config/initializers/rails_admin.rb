RailsAdmin.config do |config|

  config.main_app_name = ['咖萌亲子', '管理后台']

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :agent
  end
  config.current_user_method(&:current_agent)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  #config.authorize_with do
  #  authenticate_or_request_with_http_basic('Site Message') do |username, password|
  #    username == 'admin' && password == 'admin'
  #  end
  #end

  #config.audit_with :history, User

  config.model Event do

    navigation_label '资源管理'
    label_plural '亲子活动'
    label '亲子活动'

    list do
      field :id
      field :title
      field :category
      field :abstract
      field :contact_phone
      field :address
      field :main_image_url
      #field :attendances
      field :assets
      field :start_time
      field :end_time
      field :is_published
    end

    create do
      field :title
      field :category
      field :contact_phone
      field :abstract
      field :address
      field :main_image_url
      #field :attendances
      field :assets
      field :start_time
      field :end_time
      field :is_published
      field :content, :ck_editor
    end

    edit do
      field :title
      field :category
      field :contact_phone
      field :abstract
      field :address
      field :main_image_url
      #field :attendances
      field :assets
      field :start_time
      field :end_time
      field :is_published

      field :content, :ck_editor
    end

  end

  config.model 'Agent' do
    visible do
      # controller bindings is available here. Example:
      bindings[:controller].current_agent.has_role?(:superadmin)
    end
  end

  config.model Ckeditor::Picture do
    navigation_label '附件管理'
    label_plural '图片'
    label '图片'

    list do
      field :id
      field :title
      field :data
      field :width
      field :height
    end

    show do
      field :id
      field :title
      field :data
      field :width
      field :height
    end


    create do
      field :data
      field :width
      field :height
    end

    edit do
      field :data
      field :width
      field :height
    end

  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    #export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
