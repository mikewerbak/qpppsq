require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:q1) { create(:question) }
  let(:a1) { create(:answer, question: q1)}

  describe 'GET #new' do
    before { get :new, params: { question_id: q1 } }

    it 'assings a new Answer to @aintswer' do
      expect(assigns(:aintswer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { question_id: q1, id: a1 } }

    it 'assings the requested Answer to @aintswer' do
      expect(assigns(:aintswer)).to eq a1
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    before { get :show, params: { question_id: q1, id: a1 } }

    it 'assings the requested answer to @aintswer' do
      expect(assigns(:aintswer)).to eq a1
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new answer in the database' do
        expect { post :create, params: { question_id: q1, answer_data: attributes_for(:answer) } }.to change(Answer, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { question_id: q1, answer_data: attributes_for(:answer) }
        expect(response).to redirect_to question_answer_path(assigns(:question), assigns(:aintswer))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect { post :create, params: { question_id: q1, answer_data: attributes_for(:invalid_answer) } }.to_not change(Answer, :count)
      end

      it 're-renders new view' do
        post :create, params: { question_id: q1, answer_data: attributes_for(:invalid_answer) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assings the requested answer to @aintswer' do
        patch :update, params: { question_id: q1, id: a1, answer_data: attributes_for(:answer) }
        expect(assigns(:aintswer)).to eq a1
      end

      it 'changes answer attributes' do
        patch :update, params: { question_id: q1, id: a1, answer_data: { body: 'new text' } }
        a1.reload
        expect(a1.body).to eq 'new text'
      end

      it 'redirects to the updated answer' do
        patch :update, params: { question_id: q1, id: a1, answer_data: attributes_for(:answer) }
        expect(response).to redirect_to question_answer_path(assigns(:question), assigns(:aintswer))
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: { question_id: q1, id: a1, answer_data: attributes_for(:invalid_answer) } }
      it 'does not change question attributes' do
        a1.reload
        expect(a1.body).to eq 'MyText'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { a1 }
    it 'deletes answer' do
      expect { delete :destroy, params: { question_id: q1, id: a1 } }.to change(Answer, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { question_id: q1, id: a1 }
      expect(response).to redirect_to question_answer_path
    end
  end
end
