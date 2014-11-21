RailsAdmin.config do |config|

  config.main_app_name = ['Kidsmeet Admin', 'Admin']

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


  #config.model Product do
  #  edit do
  #    # For RailsAdmin >= 0.5.0
  #    #field :description, :ck_editor
  #    # For RailsAdmin < 0.5.0
  #    # field :description do
  #    #   ckeditor true
  #    # end
  #  end
  #end

  config.model Event do
    create do
      # For RailsAdmin >= 0.5.0
      #include_all_fields
      field :title do
        column_width 200
      end

      field :category
      field :contact_phone
      field :abstract
      #field :address
      field :duration
      field :main_image_url
      field :start_time
      field :end_time
      field :is_published

      field :content, :ck_editor
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end

    edit do
      field :title do
        column_width 200
      end

      field :category
      field :contact_phone
      field :abstract
      #field :address
      field :duration
      field :main_image_url
      field :start_time
      field :end_time
      field :is_published

      field :content, :ck_editor
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end

  end

  config.model Agent do
    list do
      field :username
      field :email
      field :sign_in_count
      field :last_sign_in_at
    end

    edit do
      field :username
      field :email
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
