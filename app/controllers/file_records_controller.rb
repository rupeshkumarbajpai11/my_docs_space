class FileRecordsController < ApplicationController
  before_action :authenticate_user!

  def index

    @file_records = current_user.file_records
  end

  def new
    @file_record = FileRecord.new
  end

  def create
    @file_record = current_user.file_records.new(file_record_params)
    if @file_record.save
      redirect_to file_records_path, notice: "File uploaded successfully."
    else
      flash.now[:alert] = @file_record.errors.full_messages.to_sentence # Set the flash message
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @file_record = current_user.file_records.find(params[:id])
    @file_record.destroy
    redirect_to file_records_path, notice: "File deleted successfully."
  end

  def show
    file_record = FileRecord.find(params[:id])
    send_file file_record.file.path, type: file_record.file.content_type, disposition: 'inline'
  end


  # Action to create a shared URL
  def share
    @file_record = current_user.file_records.find(params[:id])
    if @file_record.shared_url.nil?
      @file_record.create_shared_url  # This will create the associated SharedUrl record
    end
    redirect_to file_records_path, notice: "Shareable URL generated!"
  end

  private

  def file_record_params
    params.require(:file_record).permit(:title, :description, :file)
  end
end
