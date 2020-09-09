require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
    def setup
        @projects = Project.new(name: "Project Name", description: "Project Description", created_at: DateTime.now, updated_at: DateTime.now)
      end
    
      test "name and description should be valid" do
        
        assert @projects.valid?
      end
    
      test "name and description should be present" do 
        @projects.name = " "
        @projects.description = " "
        assert_not @projects.valid?
      end
    
      test "name should have more than 6 character" do 
        @projects.name = "a" * 5
        assert_not @projects.valid?
      end
    
      test "name should have less than 100 character" do 
        @projects.name = "a" * 101
        assert_not @projects.valid?
      end
  
end