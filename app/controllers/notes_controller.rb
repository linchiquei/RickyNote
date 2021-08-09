class NotesController < ApplicationController

    def index
    end

    def new
        @note = Note.new
    end

    def create
        #render html: params
        #params["params"] 要問為什麼可以？
        title = params[:title] 
        content = params[:content]
        note = Note.new(title: title, content: content)

        if(note.save)
            redirect_to "/notes" #這是蛇沒意思？
        else
            #待處理
        end
    end
end