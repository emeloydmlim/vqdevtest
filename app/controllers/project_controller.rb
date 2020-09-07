class ProjectController < ApplicationController
    load_and_authorize_resource param_method: :my_sanitizer
    
    def index
        
        #@projectlist= Project.all

            @projectlist= current_user.projects
        
    end

    def show

       
        @projects= Project.find(params[:id])

        @tasks = @projects.tasks
        
       
        
    end

    def new 
        @project = Project.new
    end

    def create 
        #render plain: params[:projects] 
        
        @project = Project.new(params.require(:project).permit(:name, :description))
        @project.user = current_user
        
        if @project.save
            flash[:notice] = "New project added."
            #redirect_to @project
            render 'new'
        else 
            render 'new'
        end
        #render plain:  @project.inspect
        
    end

    def edit
        
        @project= Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(params.require(:project).permit(:name, :description))
        
            flash[:notice] = "Project was successfully updated."
            redirect_to @project
            
        else 
            render 'edit'
        end
    end

    def destroy
        @project= Project.find(params[:id])
        @project.destroy
        flash[:notice]='Project was successfully deleted.'
        redirect_to project_index_path
    end

    private

    def my_sanitizer
        params.require(:project).permit(:name)
    end
  end
  