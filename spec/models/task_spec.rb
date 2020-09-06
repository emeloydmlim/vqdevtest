require 'rails_helper'

RSpec.describe Task, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  let(:task) {Task.new}

  it "is not valid with no content" do 
    expect(task).not_to be_valid
  end

end