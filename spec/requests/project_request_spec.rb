require 'rails_helper'

RSpec.describe "Projects", type: :request do
    let(:user) {User.create(email: 'test@test.com', password: "password", password_confirmation: "password")}
    let(:project) {Project.new(name: "Project name", description: "Project Description")}

    describe "GET #index" do 
        it "renders the index template" do
            sign_in user
            get project_index_path
            expect(response).to render_template("index")
            sign_out user
          end
    end

    describe "GET #create" do
        it "should add new project" do 
            sign_in user
            project.user = user
            expect(project.save).to be true
           sign_out user
        end
    end

    describe "DELETE Project" do 
        it "should delete a project" do
            sign_in user
            project.user = user
            newproject = project.save
            
            pid= user.projects.last().id
            
            expect { delete :"/project/#{pid}"}.to change(Project, :count).by(-1)
            expect(flash[:notice]).to eq 'Project was successfully deleted.'
            expect(subject).to redirect_to(project_index_path)
        end
    end

    describe "UPDATE Project" do 
       
        it "should update a project" do
            params = {
                name: "Update Project Name", 
                description: "Update Description"
            }
            sign_in user
            project.user = user
            newproject = project.save
            pid= user.projects.last.id
            put :"/project/#{pid}" , params: { id: pid, project: params }
            project.reload
            params.keys.each do |key|
                expect(project.attributes[key.to_s]).to eq params[key]
            end
            expect(flash[:notice]).to eq 'Project was successfully updated.'
            expect(subject).to redirect_to(project)
    
            
        end
    end

    
end
