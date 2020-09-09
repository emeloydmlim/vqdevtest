require 'rails_helper'

RSpec.describe Project, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #project {Project.new}
  let(:project) {Project.new(name: "Project Name", description: "Project Description")}

  it "is not valid with no name" do 
    project.name = ''
    expect(project).not_to be_valid
  end

  it "is not valid with a name longer than 100 characters" do
    project.name = 'a' * 101
    expect(project).not_to be_valid
  end

  it "is not valid with a name shorter than 2 characters" do
    project.name = 'a' * 2
    expect(project).not_to be_valid
  end

  it "is not valid with a description longer than 300 characters" do
    project.name = 'a' * 301
    expect(project).not_to be_valid
  end

  it "is not valid with a description shorter than 6 characters" do
    project.name = 'a' * 5
    expect(project).not_to be_valid
  end
end


