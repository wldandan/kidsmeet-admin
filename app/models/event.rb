class Event < ActiveRecord::Base
  has_many :attendances

  def adults_number
    attendances.inject(0) { |result, item|
      result + item.adults_number
    }
  end

  def children_number
    attendances.inject(0) { |result, item|
      result + item.children_number
    }
  end

  def is_expired?
    end_time < Time.new
  end

  def detail_image_url
    main_image_url.gsub('medium','large')
  end

  def mail_image_url
    main_image_url.gsub('medium','wechat')
  end


  def users
    #User.in(id: attendances.map(&:user_id))
  end


end
