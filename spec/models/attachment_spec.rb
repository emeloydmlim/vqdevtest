require 'rails_helper'

RSpec.describe Attachment, type: :model do
  let(:attachfile) {Attachment.new( name: "Filename",file: "file", task_id: 2, created_at: DateTime.now, updated_at: DateTime.now)}

  it "is not valid with no name" do 
    attachfile.name = ''
    expect(attachfile).not_to be_valid
  end

  it "is not valid with a name shorter than 2 characters" do
    attachfile.name = 'a' * 2
    expect(attachfile).not_to be_valid
  end

end
