class DocsController < ApplicationController
	before_action :find_docs, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :delete]

	def index
		@docs = Doc.all.order("created_at DESC")
	end

	def new
		 @doc = current_user.docs.build
	end

	def create
		@doc = current_user.docs.build(docs_params)
		if @doc.save
			flash[:sucess] = "Document is saved"
			redirect_to  @doc
		else
		  flash[:error]	= "Could not save document"
		  render "new"
		end  
	end



  def show
  end	

  def edit
  end

  def update
   if @doc.update(docs_params)
   	redirect_to @doc
   else
   	render "edit"
   end	
  end

	private
	def find_docs
		@doc = Doc.find(params[:id])
	end	
	def docs_params
	  params.require(:doc).permit(:title, :body)
	end

end 
