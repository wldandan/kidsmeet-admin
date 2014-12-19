module RailsAdmin
  module Config
    module Actions
      class SpecialExport < RailsAdmin::Config::Actions::Base
        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :controller do
          Proc.new do
            if request.post?
              # generate CSV data
              send_data csv_data, :filename => "export.csv", :type => "application/csv"
            end
            # renders view otherwise
          end
        end
        register_instance_option :link_icon do
          'icon-share'
        end
      end
    end
  end
end