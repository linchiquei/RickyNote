class NotesController < ApplicationController

    before_action :find_user_note, only: [ :show, :edit, :update, :destroy ]
    #same as before_filter
    #include UsersHelper
    before_action :check_login!, except: [:index, :show]

    def index
		# @notes = Note.all.sort.reverse  X
		#@notes = Note.includes(:user).order(id: :desc)
        #@notes = current_user.notes.order(id: :desc)
        @notes = Note.includes(:user).order(id: :desc) 


        # select * from users where id = 1
        # select * from users where id = 2
        # select * from users where id = 3
        # select * from users where id in (1,2,3...)
    end

    def new
        # if session[:thankyou] == nil
        #     redirect_to 'users/sign_in'
        # end

        #@note = Note.new(user_id: current_user.id )
        #下面這行等於上面這行
        @note = current_user.notes.new


        # @的用意在於說有 view 有@ 沒view沒@
        # RAW SOL == select * from notes where id =2
    end

    def show
        @note = Note.find(params[:id])
		@comment = @note.comments.new
        @comments = @note.comments.order(id: :desc)
    end

    def create
        #render html: params
        #params["params"] 要問為什麼可以？
        #title = params[:title] 
        #content = params[:content]
        #@note = Note.new(title: title, content: content)

        # clear_note = note_params
        # @note = Note.new(clear_note)

        @note = Note.new(note_params)
        @note.user_id = current_user.id
        # 上面這兩行等於下面這行
        #@note = current_user.notes.new(note_params) 
        # 上面這樣寫是因為 has_many 的關西必須讓他知道使用者是誰

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
        if @note.update(note_params)
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
    def find_user_note
		# @note = Note.find(params[:id])
		# @note = Note.find_by(id: params[:id], user_id: current_user.id)
		@note = current_user.notes.find(params[:id])
    end
end

#destory方法是post
#robots.txt