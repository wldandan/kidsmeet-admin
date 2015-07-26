class GodenDataService
  include HTTParty
  base_uri 'https://jinshuju.net/api/v1/forms'
  basic_auth 'FJsPmSRAgLGcEZYfHu2EBg', 'PHeaoqp1NY32ExNuvcApoA'

  def self.get_form(golden_data_url)
    response = self.get('/' + golden_data_url).parsed_response
    @@feild_map = {}

    response['fields'].each do |field|
      field.each do |key, value|
        if(value['type'] == 'single_choice')
          @@choice_map = choice_mapping(value)
        end
        @@feild_map[value['label']] = key
      end
    end
  end

  def self.post_data(golden_data_url, data_json)
    mapped_data = data_mapping(data_json)
    self.post('/' + golden_data_url, body: mapped_data)
  end

  private
  def self.data_mapping(data_json)
    mapped_data = {}
    mapped_data[@@feild_map['宝宝昵称']] = data_json['baby_name']
    mapped_data[@@feild_map['宝宝年龄']] = data_json['baby_age']
    mapped_data[@@feild_map['妈妈姓名']] = data_json['mother_name']
    mapped_data[@@feild_map['手机号']] = data_json['phone_number']
    mapped_data[@@feild_map['微信号']] = data_json['wechat_id']
    mapped_data[@@feild_map['报名时段']] = get_choice_value(EventTime.find(data_json['event_time_id']).display_time)
    mapped_data
  end

  def self.get_choice_value(option)
    @@choice_map[option]
  end

  def self.choice_mapping(value)
    choice_map = {}
    value['choices'].each do |choice|
      choice_map[choice['name']] = choice['value']
    end
    choice_map
  end

end
