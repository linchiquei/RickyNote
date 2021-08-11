class NotesController < ApplicationController

    def index
        @notes = Note.all
    end

    def new
        @note = Note.new() #為什麼是new一個model?
        # @的用意在於說有 view 有@ 沒view沒@
        # RAW SOL == select * from notes where id =2
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
            redirect_to "/notes/" #這是蛇沒意思？
        else
            render :new
            #redirect_to "/notes/new"
            #app/views/notes.new.html.erb
        end
    end
end