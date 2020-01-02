class PostsController < ApplicationController
    def index
        posts = Post.all
        render :json => posts
    end

    def show
        post = Post.find(params[:id])
        render :json => post
    end

    def create
        if contractee?
            contractee = current_contractee
            if(Category.find_by(tag: params[:category]))
                category = Category.find_by(tag: params[:category])
            else
                category = Category.create(tag: params[:category])
            end        
            post = Post.new(title: params[:title], status: "NON_ASSIGNED", description: params[:description], category_id: category.id, contractee_id: contractee.id)
            if post.save
                render :json => post
            end
        end
    end

    def update
        if contractee?
            contractee = current_contractee
            post= Post.find_by(id: params[:id])
            if(post && post.contractee.id == contractee.id)
                if(post.status != "COMPLETED")
                    if(Category.find_by(tag: params[:category]))
                        category = Category.find_by(tag: params[:category])
                    else
                        category = Category.create(tag: params[:category])
                    end 
                    post.update(title: params[:title], description: params[:description], category_id: category.id)
                    render :json => Post.find_by(id: params[:id])
                else 
                    render json: {status: "error", code: 400, message: "Completed post can't be updated"}                     
                end    
            else    
                render json: {status: "error", code: 403, message: "you are not authorized to change this post"}                
            end
        end  
    end

    def assign_post
        if contractee?
            contractee = current_contractee
            post= Post.find_by(id: params[:postId])
            if(post && post.contractee.id == contractee.id)
                if(post.status == "NON_ASSIGNED")
                    user= User.find_by(email: params[:contractorEmail])
                    contractor_id= Contractor.find_by(user_id: user.id)
                    if(user && user.contractor==true)
                        post.update(contractor_id:  contractor_id, status: "ASSIGNED")
                    else
                        render json: {status: "error", code: 400, message: "contractor doesn't exist"}
                    end
                else
                    render json: {status: "error", code: 400, message: "post is not in NON_ASSIGNED status"}
                end
            else
                render json: {status: "error", code: 403, message: "you are not authorized to change this post  "}            
            end 
        else
            render json: {status: "error", code: 403, message: "please login as contractee"}    
        end    
    end
 
    
    def getContracteePosts
        begin 
            if contractee?
                contractee = current_contractee
                posts = contractee.posts
                render :json => posts
            end
        rescue RuntimeError => e
            byebug 
            render json: {status: "error", code: 403, message: "please login as contractee"}
        end    
    end

    def destroy
        if contractee?
            contractee = current_contractee
            post= Post.find_by(id: params[:id])
            if(post && post.contractee.id == contractee.id)
                post.destroy
            else
                render json: {status: "error", code: 403, message: "you are not authorized to delete this post"}            
            end
            render json: {status: "sucsess", code:200, message: "Post Deleted"}
        end
    end

end
