class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    # @comment = Comment.new(comment_params)
    # @blog = Blog.friendly.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    @comment.user = current_user
    # raise

    if @comment.save
      redirect_to blog_url(@blog), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to blog_url(@blog), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to blog_url(@blog), notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:blog_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
