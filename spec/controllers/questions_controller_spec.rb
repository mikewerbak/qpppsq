require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:q1) { create(:question) }

  describe 'GET #index' do
    let(:q_list) { create_list(:question, 2) }
    before { get :index }

    it 'populates an array of all questions' do
      expect(assigns(:huestions)).to match_array(q_list)
    end

    it 'renders index view' do
      expect(response).to render_template :index

    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: q1 } }

    it 'assings the requested question to @question' do
      expect(assigns(:question)).to eq q1
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assings a new Question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: q1 } }

    it 'assings the requested question to @question' do
      expect(assigns(:question)).to eq q1
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new question in the database' do
        expect { post :create, params: { question: attributes_for(:question) } }.to change(Question, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { question: attributes_for(:question) }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the question' do
        expect { post :create, params: { question: attributes_for(:invalid_question) } }.to_not change(Question, :count)
      end

      it 're-renders new view' do
        post :create, params: { question: attributes_for(:invalid_question) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assings the requested question to @question' do
        patch :update, params: { id: q1, question: attributes_for(:question) }
        expect(assigns(:question)).to eq q1
      end

      it 'changes question attributes' do
        patch :update, params: { id: q1, question: { title: 'new title', body: 'new body' } }
        q1.reload
        expect(q1.title).to eq 'new title'
        expect(q1.body).to eq 'new body'
      end

      it 'redirects to the updated question' do
        patch :update, params: { id: q1, question: attributes_for(:question) }
        expect(response).to redirect_to q1
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: { id: q1, question: { title: 'new title', body: nil } } }
      it 'does not change question attributes' do
        q1.reload
        expect(q1.title).to eq 'MyString'
        expect(q1.body).to eq 'MyText'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { q1 }
    it 'deletes question' do
      expect { delete :destroy, params: { id: q1 } }.to change(Question, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: q1 }
      expect(response).to redirect_to questions_path
    end
  end
end
