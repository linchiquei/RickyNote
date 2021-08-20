class CommentsController < ApplicationController
    before_action :check_login!
    before_action :find_user_note

    def create
        @note.comments.new(comment_params)
        #@note.user = current_user

        
        if(@note.save)
            @content = comment_params[:content]
            #redirect_to @note #這個是簡寫
            # '/notes/#{@note.id}'
            # note_path(@note)
            # 如果是要直接去看 show 頁面 Prefix 可以省略
        else
            redirect_to '/'
        end
        #render html: params
    end

    private 
    def comment_params
        params.require(:comment)
        .permit(:content)
        .merge(user_id: current_user.id) #為了 comment model belongs_to 問題要加 user id
    end

    def find_user_note
        @note = Note.find(params[:note_id])
    end
end

# AJAX 非同步傳輸