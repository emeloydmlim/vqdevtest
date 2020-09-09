require 'rails_helper'

RSpec.describe "Tasks", type: :request do
    let!(:user) {User.create(email: 'test@test.com', password: "password", password_confirmation: "password")}
    let!(:project) {Project.new(name: "Project name", description: "Project Description")}
    let!(:task) {Task.new(task: "Do this task")}

    # describe "GET #index" do 
    #     it "renders the index template" do
    #         sign_in user
    #         get project_index_path
    #         expect(response).to render_template("index")
    #         sign_out user
    #       end
    # end

    describe "CREATE Task" do
        it "should add new task" do 
            sign_in user
            project.user = user
            project.save
            task.project = project
            expect(task.save).to be true
           sign_out user
        end
    end

    describe "DELETE Task" do 
        it "should delete a task" do
            sign_in user
            project.user = user
            newproject = project.save
            task.project = project
            
            task.save
            delete task_url(task), xhr: true
            expect(response).to render_template(partial: 'project/_tasklist')
            
            
            
        end
    end

    describe "UPDATE Task" do 
       
        it "should update a task" do
            
            params = {
                "task": {
                    "task": "Test Task"
                },
                "deadline": {
                    "year": "2020",
                    "month": "11",
                    "day": "8",
                    "hour": "00",
                    "minute": "00"
                },
                "commit": "Save",
                "controller": "task",
                "action": "update",
                "id": "66"
            }
            deadline = DateTime.new(params[:deadline][:year].to_i, 
            params[:deadline][:month].to_i, 
            params[:deadline][:day].to_i, 
            params[:deadline][:hour].to_i, 
            params[:deadline][:minute].to_i, 
            0)
            sign_in user
            project.user = user
            newproject = project.save
            task.project = project
            task.save
            patch :"/task/#{task.id}" , params: params, xhr: true
            task.reload
            expect(task.task).to eq params[:task][:task]
            expect(task.deadline).to eq deadline
            expect(flash[:notice]).to eq 'Task was successfully updated.'
              
        end
    end

    
end
