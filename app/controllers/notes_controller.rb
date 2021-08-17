class NotesController < ApplicationController

    before_action :find_note, only: [ :show, :edit, :update, :destroy ]
    #same as before_filter
    #include UsersHelper
    before_action :check_login!, except: [:index, :show]

    def index
		# @notes = Note.all.sort.reverse  X
		@notes = Note.order(id: :desc)
    end

    def new
        # if session[:thankyou] == nil
        #     redirect_to 'users/sign_in'
        # end

        @note = Note.new() #為什麼是new一個model?
        # @的用意在於說有 view 有@ 沒view沒@
        # RAW SOL == select * from notes where id =2
    end

    def show
    end

    def create
        #render html: params
        #params["params"] 要問為什麼可以？
        #title = params[:title] 
        #content = params[:content]
        #@note = Note.new(title: title, content: content)

        clear_note = note_params
        @note = Note.new(clear_note)

        if(@note.save)
            redirect_to "/notes/" #這是蛇沒意思？
        else
            render :new
            #redirect_to "/notes/new"
            #app/views/notes.new.html.erb
        end
    end

    def edit
    end

    def update
        clear_note = note_params
        if @note.update(clear_note)
            redirect_to "/notes/" 
        else
            render :edit
        end
    end

    def destroy
		@note.update(deleted_at: Time.now)
		redirect_to "/notes"
    end

    private
    def note_params
        params.require(:note).permit(:title, :content)
    end

    private
    def find_note
        @note = Note.find(params[:id])
    end
end

#destory方法是post
#robots.txt