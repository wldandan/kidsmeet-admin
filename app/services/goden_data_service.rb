class GodenDataService
  include HTTParty
  base_uri 'https://jinshuju.net/api/v1/forms'
  basic_auth 'FJsPmSRAgLGcEZYfHu2EBg', 'PHeaoqp1NY32ExNuvcApoA'

  def self.get_form
    response = self.get('/tSWP8l').parsed_response
    feild_map = {}
    response['fields'].each do |field|
      field.each do |key, value|
        feild_map[value['label']] = key
      end
    end
    feild_map
  end
end
