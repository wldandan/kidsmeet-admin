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

  #config.audit_with :history, User

  config.model StarMother do

    navigation_label '资源管理'
    label_plural '达人妈妈'
    label '达人妈妈'

    list do
      field :id do
        column_width 50
      end
      field :name
      field :profession
      field :introduction do
        column_width 100
      end
    end

    create do
      field :picture do
        active true
      end

      field :name
      field :profession
      field :introduction
    end

    edit do
      field :picture do
        #active true
      end

      field :name
      field :profession
      field :introduction
    end

    show do
      field :name
      field :profession
      field :introduction
    end

  end

  config.model Event do

    navigation_label '资源管理'
    label_plural '亲子活动'
    label '亲子活动'

    list do
      field :brand_thumb_url do
        column_width 100
        formatted_value do
          bindings[:view].tag(:img, { :src => (bindings[:object].brand_thumb_url) })
        end
      end

      field :id do
        column_width 50
      end
      field :title
      #field :category
      field :contact_phone do
        column_width 100
      end
      field :attendances, :string do
        label "参与者人数"
        column_width 100
        formatted_value do
          bindings[:object].attendances.count
        end
      end
      #field :is_published
      field :address do
        label "参与者名单"
        pretty_value do
          bindings[:view].tag(:a, { :href => "/events/#{bindings[:object].id}.xls" }) << '下载'
        end
      end
    end

    create do
      field :pictures do
        active true
      end

      field :title
      field :category
      field :contact_phone
      field :abstract
      field :address
      field :attendances do
        #active true
      end
      field :pictures do
        #active true
      end
      field :start_time
      field :end_time
      field :is_published
      field :valuable_items
      field :content, :ck_editor
    end

    edit do
      field :pictures do
        #active true
      end

      field :title
      field :category
      field :contact_phone
      field :abstract
      field :address
      field :attendances do
        #active true
        inverse_of :event
      end
      field :start_time
      field :end_time
      field :is_published
      field :valuable_items
      field :content, :ck_editor
    end

    show do
      field :title
      field :category
      field :contact_phone
      field :abstract
      field :address
      field :brand_thumb_url do
        column_width 100
        formatted_value do
          bindings[:view].tag(:img, { :src => (bindings[:object].brand_thumb_url) })
        end
      end

      field :attendances do
        active true
      end

      field :start_time
      field :end_time
      field :valuable_items
      field :content do
        formatted_value do
          (bindings[:view].tag(:div) << value.html_safe)
        end
      end
    end

  end

  config.model 'Attendance' do
    navigation_label '资源管理'
    label_plural '参与者'
    label '参与者'

    list do
      field :event
      field :username
      field :phone_number
      field :children_number
      field :adults_number
    end

    show do
      field :event
      field :username
      field :phone_number
      field :children_number
      field :adults_number
    end

    edit do
      field :event
      field :username
      field :phone_number
      field :children_number
      field :adults_number
    end

    create do
      field :event
      field :username
      field :phone_number
      field :children_number
      field :adults_number
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
    end

    show do
      field :id
      field :title
      field :data
    end


    create do
      field :data
    end

    edit do
      field :data
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