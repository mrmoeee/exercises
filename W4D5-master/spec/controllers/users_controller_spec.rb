require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET#new' do
    
    it 'renders new user template' do
      get :new
      expect(response).to render_template(:new)
    end
    
    it 'successfully connects with status 200~' do 
      get :new
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'POST#create' do 
    it 'successfully creates a new user with valid params' do 
      post :create, params: { user: { username: 'John', email: 'not again', password: 'longbou' } }
      expect(response).to redirect_to(users_url)
    end
    
    context 'with invalid params' do 
      it 'validates presence of email and password' do 
        post :create, params: { user: { username: 'John'} }  
        expect(response).to render_template(:new)
        expect(flash[:errors]).to_not be_nil
      end
    end
  end
  
  
  describe 'GET#index' do
    
    it 'renders index user template' do
      get :index
      expect(response).to render_template(:index)
    end
    
    it 'successfully connects with status 200~' do 
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
