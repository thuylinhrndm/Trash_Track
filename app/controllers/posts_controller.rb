class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :set_post, only: [:view, :show, :edit, :update, :destroy]




  def view
    respond_to do |format|
      format.html {}
      format.js {}
      format.xml {}
    end
  end
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html 
      format.json { render json: @posts }
      format.xml { render xml: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  # GET /posts/1.xml
  def show
    respond_to do |format|
      format.html 
      format.json { render json: @post }
      format.xml { render xml: @post }
    end
  end

  # GET /posts/new
  def new
    @city = request.location.city
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def check_current_user_is_signed_in
      unless current_user_signed_in?
        redirect_to root_url, notice: "Please sign in to do that"
      end
    end

    def current_user_signed_in?
        current_user ? true : false
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id, :image_path, :rating, :ip_address, :lat, :lon, :address)
    end
end
