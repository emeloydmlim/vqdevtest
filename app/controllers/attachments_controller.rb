class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all
    respond_to do |format|
            
      format.html { render partial: 'attachments/index'}
  end
  end

  def viewfiles
    @attachment = Attachment.new
    @tasks = Task.find(params[:id])
    @attachments = @tasks.attachments
    
    if @attachments
        
        respond_to do |format|
            format.html { render partial: 'attachments/index'}
            format.js { render partial: 'project/viewfiles'}
        end
    end
end



  # POST /attachments
  def create
    @attachment = Attachment.new(attachment_params)
    @tasks = Task.find(params[:tid])
    @attachment.task_id = params[:tid]
    
    respond_to do |format|
      if @attachment.save
        flash[:notice] = "File was successfully uploaded."
        format.html { render partial: 'attachments/index'}
        format.js { render partial: 'project/viewfiles'}
      else 
        flash[:notice] = @attachment.errors
        format.html { render partial: 'attachments/index'}
        format.js { render partial: 'project/viewfiles'}
      end
    end
   
  end

  # DELETE /attachments/1
  def destroy

    
    @tasks = Task.find(@attachment.task_id)
    
    
    respond_to do |format|
      if @attachment.destroy
        flash[:notice] = "File was successfully uploaded."
        format.html { render partial: 'attachments/index'}
        format.js { render partial: 'project/viewfiles'}
      else 
        flash[:notice] = @attachment.errors
        format.html { render partial: 'attachments/index'}
        format.js { render partial: 'project/viewfiles'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_params
      params.require(:attachment).permit(:name, :file)
    end
end
