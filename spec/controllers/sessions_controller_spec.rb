require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  
  describe "GET #new" do
    before(:each) { get :new }

    it "should be success" do
      expect(response).to be_success
    end

    it "should render new template(the user template)" do
      expect(response).to render_template("new")
    end
  end
  
  describe "POST #create" do
    let(:user) {assigns(:user)}
    context "when user exists" do
      before(:each) { post :create, params: attributes_for(:user) }

      it "should redirect successfully" do
        expect(response).to redirect_to rooms_path
      end

      it "should set session user_id with the right id" do
        expect(session[:user_id]).to eq user.id
      end
    end
    
    context "when user does not exist" do
      before(:each) { post :create, params: attributes_for(:user) }

      it "should redirect successfully" do
        expect(response).to redirect_to rooms_path
      end

      it "should set session user_id with the right id" do
        expect(session[:user_id]).to eq user.id
      end
      
      it "should save the user" do
        expect(user).to be_persisted
      end
    end
  end
  
  describe "DELETE #destroy" do
    it "should delete the session user_id" do
      session[:user_id] = 1
      expect(session[:user_id]).to eq 1
      delete :destroy
      expect(session[:user_id]).to eq nil
    end

    it "should redirect to new session path" do
      delete :destroy
      expect(response).to redirect_to new_session_path
    end
  end

end
