class PublicFilesController < ApplicationController
  # Access the file via the shared URL
  def show
    @shared_url = SharedUrl.find_by(shared_url: params[:shared_url])
    
    if @shared_url
      @file_record = @shared_url.file_record
      redirect_to @file_record.my_file.url  # Redirect to the actual file URL
    else
      render plain: "File not found", status: :not_found
    end
  end
end
