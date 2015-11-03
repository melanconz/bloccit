class Api::V1::CommentsController < Api::V1::BaseController
    before_filter :authenticate_user, except: [:index, :show]
    before_filter :authorize_user, except: [:index, :show]
    
    def index
        comments = Comment.all
        render json: comments.to_json, status: 200
    end
    
    def show
        comment = Comment.find(params[:id])
        render json: comment.to_json, status: 200
    end
    
    def update
        comment = Comment.find(params[:id])
 
        if comment.update_attributes(comment_params)
            render json: comment.to_json, status: 200
        else
            render json: {error: "Comment update failed", status: 400}, status: 400
        end
    end
    
    def create
        comment = Comment.new(comment_params)
 
        if comment.valid?
            comment.save!
            render json: comment.to_json, status: 201
        else
            render json: {error: "Comment is invalid", status: 400}, status: 400
        end
    end
    
    def destroy
        comment = Comment.find(params[:id])
 
        if comment.destroy
             render json: {message: "Comment destroyed", status: 200}, status: 200
        else
             render json: {error: "Comment destroy failed", status: 400}, status: 400
        end
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body)
    end
end