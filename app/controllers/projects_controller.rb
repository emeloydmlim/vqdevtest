class ProjectsController < ApplicationController
    def index
    end

    def show

        byebug
        @projectlist= Projects.find(params[:id])


    end
  end
  