class Ckeditor::PicturesController < Ckeditor::ApplicationController

  #To authorize certain user to upload picture, override the index method as
  # https://github.com/galetahub/ckeditor/issues/246 or
  # http://stackoverflow.com/questions/25007464/rails-limited-browsing-of-user-attachments-using-ckeditor-gem-w-cancan-pape

  def index
    @pictures = Ckeditor.picture_adapter.find_all(ckeditor_pictures_scope(assetable_id: ckeditor_current_user))
    @pictures = Ckeditor::Paginatable.new(@pictures).page(params[:page])

    respond_with(@pictures, :layout => @pictures.first_page?)
  end

  def create
    @picture = Ckeditor.picture_model.new
    respond_with_asset(@picture)
  end

  def destroy
    @picture.destroy
    respond_with(@picture, :location => pictures_path)
  end

  protected

    def find_asset
      @picture = Ckeditor.picture_adapter.get!(params[:id])
    end

    def authorize_resource
      model = (@picture || Ckeditor.picture_model)
      @authorization_adapter.try(:authorize, params[:action], model)
    end
end
