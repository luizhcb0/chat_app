require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  
  describe "GET #index" do
    let(:test_messages) { 2.times.map { create(:message, user: create(:user)) } }
    let(:user) { create(:user) }
    before(:each) do
      session[:user_id] = user.id
      get :index
    end
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "should render all messages" do
      expect(assigns(:messages)).to match_array test_messages
    end
  end
  
  describe "GET #translate" do
    let(:user) { create(:user) }
    before(:each) do
      session[:user_id] = user.id
      get :translate, params: {text: "hello"}
    end
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end  
  end

    
  describe "#login_required" do
    before(:each) do
      session[:user_id] = nil
    end
    
    it "should redirect_to new_session_path" do
      get :index
      expect(response).to redirect_to(new_session_path)
    end
    
    it "should redirect_to new_session_path" do
      get :translate, params: {text: "hello"}
      expect(response).to redirect_to(new_session_path)
    end
  end

end
