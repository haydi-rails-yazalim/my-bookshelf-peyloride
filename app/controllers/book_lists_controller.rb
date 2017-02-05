class BookListsController < ApplicationController
  before_action :set_book_list, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /book_lists
  # GET /book_lists.json
  def index
    @book_lists = BookList.all
    respond_to :html, :json
  end

  # GET /book_lists/1
  # GET /book_lists/1.json
  def show
  end

  # GET /book_lists/new
  def new
    @book_list = BookList.new
  end

  # GET /book_lists/1/edit
  def edit
  end

  # POST /book_lists
  # POST /book_lists.json
  def create
    if @book_list = BookList.create(book_list_params)
      render :json => @book_list
    else
      render :json => { :errors => @book_list.errors.messages }, :status => 422
    end
  end

  # PATCH/PUT /book_lists/1
  # PATCH/PUT /book_lists/1.json
  def update
    if @book_list.update(book_list_params)
      render :json => @book_list
    else
      render :json => { :errors => @book_list.errors.messages }, :status => 422
    end
  end

  # DELETE /book_lists/1
  # DELETE /book_lists/1.json
  def destroy
    @book_list.destroy
    render :json => {}, :status => :no_content
  end

  def add_to_profile
    UsersBook.create(user_id: current_user.id, book_list_id: params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_list
      @book_list = BookList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_list_params
      params.require(:book_list).permit(:name, :description, :year, :author, :publisher, :number_of_pages)
    end
end
