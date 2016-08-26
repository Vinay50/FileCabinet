class DocsController < ApplicationController

	def new
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

  def show
    find_docs
  end	


	private
	def find_docs
		@doc = Doc.find(params[:id])
	end	
	def docs_params
	  params.require(:doc).permit(:title, :body)
	end

end 
