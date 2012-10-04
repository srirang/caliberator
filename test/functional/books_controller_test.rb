require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { author_sort: @book.author_sort, flags: @book.flags, has_cover: @book.has_cover, isbn: @book.isbn, last_modified: @book.last_modified, lccn: @book.lccn, path: @book.path, pubdate: @book.pubdate, series_index: @book.series_index, sort: @book.sort, timestamp: @book.timestamp, title: @book.title, uuid: @book.uuid }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    put :update, id: @book, book: { author_sort: @book.author_sort, flags: @book.flags, has_cover: @book.has_cover, isbn: @book.isbn, last_modified: @book.last_modified, lccn: @book.lccn, path: @book.path, pubdate: @book.pubdate, series_index: @book.series_index, sort: @book.sort, timestamp: @book.timestamp, title: @book.title, uuid: @book.uuid }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
