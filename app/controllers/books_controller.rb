class BooksController < ApplicationController

  # GET /books
  # GET /books.json
  def index
    puts "Search request: #{params[:search]}"

    if params[:search] != nil
      @books = Book.where("title LIKE '%#{params[:search]}%' OR author_sort LIKE '%#{params[:search]}%'").page(params[:page]).per(25)
    else
      @books = Book.page(params[:page]).per(25)
    end
    @recent_books = Book.find(:all, :order => "timestamp asc", :limit => 5)
    @books_to_read = Book.find(:all, :include=>:tags, :conditions => ['tags.name in (?)',['to-read']])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    # return send_file @book.get_filepath, :type => 'application/pdf', :filename => @book.get_filename
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  def download
    @book = Book.find(params[:id])
    data_id = Integer(params[:data_id])
    return send_file @book.get_filepath(data_id), :type => 'application/pdf', :filename => @book.get_filename(data_id)
  end

  # # GET /books/new
  # # GET /books/new.json
  # def new
  #   @book = Book.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @book }
  #   end
  # end

  # # GET /books/1/edit
  # def edit
  #   @book = Book.find(params[:id])
  # end

  # # POST /books
  # # POST /books.json
  # def create
  #   @book = Book.new(params[:book])

  #   respond_to do |format|
  #     if @book.save
  #       format.html { redirect_to @book, notice: 'Book was successfully created.' }
  #       format.json { render json: @book, status: :created, location: @book }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @book.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /books/1
  # # PUT /books/1.json
  # def update
  #   @book = Book.find(params[:id])

  #   respond_to do |format|
  #     if @book.update_attributes(params[:book])
  #       format.html { redirect_to @book, notice: 'Book was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @book.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /books/1
  # # DELETE /books/1.json
  # def destroy
  #   @book = Book.find(params[:id])
  #   @book.destroy

  #   respond_to do |format|
  #     format.html { redirect_to books_url }
  #     format.json { head :no_content }
  #   end
  # end

end
