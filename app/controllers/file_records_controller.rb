class FileRecordsController < ApplicationController
  before_action :authenticate_user!, :set_file_record, only: [:show, :destroy, :share]

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
    @file_record.destroy
    redirect_to file_records_path, notice: "File deleted successfully."
  end

  def show
    send_file @file_record.file.path, type: @file_record.file.content_type, disposition: 'inline'
  end

  # Action to create a shared URL
  def share
    if @file_record.shared_url.nil?
      @file_record.create_shared_url  # This will create the associated SharedUrl record
    end
    redirect_to file_records_path, notice: "Shareable URL generated!"
  end

  private

  # Common method to set the file record and handle errors
  def set_file_record
    @file_record = current_user.file_records.find_by(id: params[:id])
    if @file_record.nil?
      flash[:alert] = "File not found."
      redirect_to root_path and return
    end
  end

  def file_record_params
    params.require(:file_record).permit(:title, :description, :file)
  end
end
