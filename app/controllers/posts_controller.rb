class PostsController < ApplicationController

  before_action :log_in, :except => :index

  before_action :set_post, only: [:show, :edit, :update, :destroy]


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where('status != ?', 'hidden').sort {|a,b| a.helping_users.count <=> b.helping_users.count}
  end

  def hide
    post = Post.find(params[:id])
    post.update(status: "hidden")
    respond_to do |format|
      format.html { redirect_to "/posts", notice: 'Post removido.' }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    instance = {}
    # if [0,1].include?(params[:category].to_i)
      instance['category'] = params[:category]
    # end
    #puts "AQUI ESTA LA CATEGORIA: "
    #puts instance['category']
    puts [0,1].include?(params[:category].to_i)
    instance['post'] = Post.new
    instance['post'].location = Location.new
    instance['requirements'] = Requirement.all
    instance['location'] = Geocoder.address(request.remote_ip)
    @instance = instance
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    puts post_params
    @post = Post.new(post_params)
    params[:requirement].each do |key, req|
      if req["id"] =="1"
        item = Requirement.find(key)
        @post.requirements << item
      end
    end
    @post.errors.messages
     if @post.save
        # format.html { render :index, notice: 'Post was successfully created.' }
        # format.json { render :index, status: :created, location: @post }
        redirect_to posts_path
      else
        render text: @post.errors.messages.to_s
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
    @post.update(status: "hidden")
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post ha sido borrado.' }
      format.json { head :no_content }
    end
  end

  def help

  end

  def submit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      par = params.require(:post).permit(:content, :phone, :category, :location_id, location_attributes: [:id, :address, :latitude, :longitude, :state])
      par['user_id'] = current_user.id
      par
    end

  def log_in
    unless current_user
      redirect_to "/auth/facebook"
    end
  end
end
