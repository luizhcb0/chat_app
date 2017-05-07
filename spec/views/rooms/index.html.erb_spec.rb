require 'rails_helper'

RSpec.describe "rooms/index.html.erb", type: :view do
  before(:each) {
    create(:message)
    create(:message, text: "Hello")
    assign(:messages, Message.all)
    render
  }

  it "should display all messages" do
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Hello/)
  end
end
