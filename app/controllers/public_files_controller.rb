class PublicFilesController < ApplicationController
  # Access the file via the shared URL
  def show
    @shared_url = SharedUrl.find_by(shared_url: params[:shared_url])   
    if @shared_url
      file_record = @shared_url.file_record
      send_file file_record.file.path, type: file_record.file.content_type, disposition: 'inline'
    else
      render plain: "File not found", status: :not_found
    end
  end
end
