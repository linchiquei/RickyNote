class NotesController < ApplicationController

    def index
        @note = Note.order(id: :desc)
    end

    def new
        @note = Note.new
    end

    def show
        @note = Note.find(params[:id])
    end

    def create
        #render html: params
        #params["params"] 要問為什麼可以？
        #title = params[:title] 
        #content = params[:content]
        #@note = Note.new(title: title, content: content)

        clear_note = params.require(:note).permit(:title, :content)
        @note = Note.new(clear_note)

        if(@note.save)
            redirect_to "/notes" #這是蛇沒意思？
        else
            render :new
        end
    end
end