class TaskController < ApplicationController
    
    def index

    end
    def show 

    end
    def create
        @task = Task.new(params.require(:task).permit(:task, :deadline, :project_id))
        @task.project = current_user
        
        if @task.save
            flash[:notice] = "New task added."
            render 'new'
        else 
            render 'new'
        end
    end
    def destroy
        @task= Task.find(params[:id])
        @task.destroy
        flash[:notice]='Task was successfully deleted.'
        
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(params.require(:task).permit(:task, :status, :deadline))
        
            flash[:notice] = "Task was successfully updated."
            redirect_to @task
            
        else 
            render 'edit'
        end
    end

    private

    def my_sanitizer
        params.require(:task).permit(:task, :deadline, :status, :project_id)
    end

end