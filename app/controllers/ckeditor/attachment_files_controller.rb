class Ckeditor::AttachmentFilesController < Ckeditor::ApplicationController

  #To authorize certain user to upload picture, override the index method as
  # https://github.com/galetahub/ckeditor/issues/246 or
  # http://stackoverflow.com/questions/25007464/rails-limited-browsing-of-user-attachments-using-ckeditor-gem-w-cancan-pape

def index
    @attachments = Ckeditor.attachment_file_adapter.find_all(ckeditor_attachment_files_scope(assetable_id: ckeditor_current_user))
    @attachments = Ckeditor::Paginatable.new(@attachments).page(params[:page])

    respond_with(@attachments, :layout => @attachments.first_page?)
  end

  def create
    @attachment = Ckeditor.attachment_file_model.new
    respond_with_asset(@attachment)
  end

  def destroy
    @attachment.destroy
    respond_with(@attachment, :location => attachment_files_path)
  end

  protected

    def find_asset
      @attachment = Ckeditor.attachment_file_adapter.get!(params[:id])
    end

    def authorize_resource
      model = (@attachment || Ckeditor.attachment_file_model)
      @authorization_adapter.try(:authorize, params[:action], model)
    end
end
