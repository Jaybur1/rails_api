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
        expect(response_body.size).to eq(2)
        expect(response_body).to eq([
          {
            "id" => 1,
            "title" => 'Summer Camp at Azkaban',
            "author_name" => "Jerry The Mouse",
            "author_initials" => "J.T",
            "author_age" => 120
          },{
            "id" => 2,
            "title" => 'A Story of the Noseless Person',
            "author_name" => 'Tom The Cat',
            "author_initials" => 'T.T',
            "author_age" => 122
          }
        ])
    end

    it 'returns a subset of books based on limit' do
      get '/api/v1/books', params: {limit: 1}

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq([
        {
          "id" => 1,
          "title" => 'Summer Camp at Azkaban',
          "author_name" => "Jerry The Mouse",
          "author_initials" => "J.T",
          "author_age" => 120
        }
      ])
    end

    it 'returns a subset of books based on limit and offset' do
      get '/api/v1/books', params: {limit: 1, offset: 1}

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(1)
      expect(response_body).to eq([
        {
          "id" => 2,
          "title" => 'A Story of the Noseless Person',
          "author_name" => 'Tom The Cat',
          "author_initials" => 'T.T',
          "author_age" => 122
        }
      ])
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
      expect(response_body).to eq(
        {
          "id" => 1,
          "title" => 'The Guy Who Made My School Years a Nigthmare',
          "author_name" => 'Harry Potter',
          "author_initials" => "H.P",
          "author_age" => 14
        }
      )
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
