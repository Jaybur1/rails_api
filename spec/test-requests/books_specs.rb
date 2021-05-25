require 'rails_helper'

describe "Books API", type: :request do
  describe 'GET /books' do
    before do
      FactoryBot.create :author, :jerry
      FactoryBot.create :author, :tom
      FactoryBot.create :book, :book1
      FactoryBot.create :book, :book2
    end
    it 'returns all books' do
        get '/api/v1/books'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /books' do
    it 'creates a new book' do
      expect {
        post '/api/v1/books', params: {
          book: {title: 'The Guy Who Made My School Years a Nigthmare'},
          author: {first_name: 'Harry', last_name:'Potter', age: 14}
        }
      }.to change { Book.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['title']).to eq('The Guy Who Made My School Years a Nigthmare')
      expect(Author.count).to eq(1)
    end
  end

  describe 'DELETE /books/:id' do
    let!(:author) {FactoryBot.create :author, :jerry}
    let!(:book) { FactoryBot.create :book, :book1 }
    it 'deletes a book' do
      expect {
        delete "/api/v1/books/#{book.id}"
      }.to change {Book.count}.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
