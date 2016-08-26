class DocsController < ApplicationController

	def index
		@docs = Doc.all
	end

	def new
		@doc = Doc.new
	end

  def show
    find_docs
  end	

  def edit
  	find_docs
  end

  def update
  end

	def create
		@doc = Doc.new(docs_params)
		if @doc.save
			flash[:sucess] = "Document is saved"
			redirect_to  doc_path(@doc)
		else
		  flash[:error]	= "Could not save document"
		  render "new"
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
