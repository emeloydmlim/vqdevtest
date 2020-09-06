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
            expect { delete :"/task/#{task.id}"}.to change(Task, :count).by(-1)
            expect(flash[:notice]).to eq 'Task was successfully deleted.'
           
        end
    end

    describe "UPDATE Task" do 
       
        it "should update a task" do
            
            params = {
                task: "Update To Do", 
                deadline: "2020-09-12 20:36:59",
                status: true
            }
            sign_in user
            project.user = user
            newproject = project.save
            task.project = project
            task.save
            put :"/task/#{task.id}" , params: { id: task.id, task: params }
            task.reload
            params.keys.each do |key|
                expect(task.attributes[key.to_s]).to eq params[key]
            end
            expect(flash[:notice]).to eq 'Task was successfully updated.'
            
            
            
        end
    end

    
end
