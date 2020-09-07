class TaskController < ApplicationController
    
    def index

    end
    def show 

    end
    def edit
        
        @tasks= Task.find(params[:id])
        
        if @tasks
            
            respond_to do |format|
            
                format.js { render partial: 'project/edittask'}
            end
           
        
        end
        
    end

    def create
        
        deadline = DateTime.new(params[:deadline][:year].to_i, 
        params[:deadline][:month].to_i, 
        params[:deadline][:day].to_i, 
        params[:deadline][:hour].to_i, 
        params[:deadline][:minute].to_i, 
        0)
        @tasks = Task.new(params.require(:task).permit(:task))
        @tasks.deadline = deadline
        @tasks.project_id = params[:pid]
        @projects = Project.find(@tasks.project_id)
        
        if @tasks.save
            flash[:notice] = "New was successfully added."
            respond_to do |format|
            
                format.js { render partial: 'project/tasklist'}
            end
           
        end
    end
    def destroy
        @tasks= Task.find(params[:id])
        @projects = Project.find(@tasks.project_id)
        @tasks.destroy
        flash[:notice]='Task was successfully deleted.'
        respond_to do |format|
            
            format.js { render partial: 'project/tasklist'}
        end
    end

    def update
        deadline = DateTime.new(params[:deadline][:year].to_i, 
        params[:deadline][:month].to_i, 
        params[:deadline][:day].to_i, 
        params[:deadline][:hour].to_i, 
        params[:deadline][:minute].to_i, 
        0)
        @tasks = Task.find(params[:id])
        @projects = Project.find(@tasks.project_id)
        if @tasks.update(:task => params[:task][:task], :deadline => deadline) 
        
            flash[:notice] = "Task was successfully updated."
            respond_to do |format|
            
                format.js { render partial: 'project/tasklist'}
            end
        end  
        
    end

    def setdone
        @tasks = Task.find(params[:id])
        @projects = Project.find(@tasks.project_id)
        if @tasks.update(:status => true)
            flash[:notice] = "Task is set to done."
            respond_to do |format|
            
                format.js { render partial: 'project/tasklist'}
            end
        end
    end


    private

    def my_sanitizer
        params.require(:task).permit(:task, :deadline, :status, :project_id)
    end

    
end