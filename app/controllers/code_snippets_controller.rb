class CodeSnippetsController < ApplicationController
    def index 
        @code_snippets = CodeSnippet.all 
    end

    def show 
        @code_snippet = CodeSnippet.find(params[:id])
    end

    def new 
        @code_snippet = CodeSnippet.new 
    end

    def edit 
        @code_snippet = CodeSnippet.find(params[:id])
    end
end
