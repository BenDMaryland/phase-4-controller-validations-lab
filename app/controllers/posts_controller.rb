class PostsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end
  
  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end

end


# rescue_from ActiveRecord::RecordNotFound, with :render_not_found
# rescue_from ActiveRecord::RecordInvlaid, with :record_invlaid
#     # validates :

#     def create
      
#         author = Author.create!(author_params)
#         render json: author, status: :created
#       end




#     private



# def record_invlaid
#     render json: { errors: invalid.record.errors }, status: :unprocessable_entity
# end





#    def render_not_found


#     render json: {error: "eroor"} status: not_found
#    end