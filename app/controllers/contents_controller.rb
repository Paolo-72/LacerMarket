class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy ]
  #Verifico che l'utente sia logato tramite authenticate_user! di devise su tutte le funzioni ad eccezione di index e show
  before_action :authenticate_user!,except:[:index,:show]
  #Verifico se l'utente loggato è lo stesso dell'utente associato al contenuto vedi sotto la funzione che ho creato
  before_action :check_user,only: %i[edit update destroy]

  
  def index
    #La variabile @contents memorizza tutti i campi della tabella Content (Content.all)
    #@contents = Content.all.order("created_at DESC").paginate(page: params[:page], per_page: 4)
    @pagy, @contents = pagy(Content.all.order("created_at DESC"))

  end

  
  def show
  end

  
  def new
    #@content = Content.new
    @content = current_user.contents.build
  end

  
  def edit
  end

  
  def create
    #@content = Content.new(content_params)
    @content = current_user.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to content_url(@content), notice: "Content was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to content_url(@content), notice: "Content was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1 or /contents/1.json
  def destroy
    @content.destroy
    
    respond_to do |format|
      format.html { redirect_to contents_url ,notice: "Content was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      #Inserimento di friendly_id
      @content = Content.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:titolo, :descrizione, :price, :cover, :allegato)
    end

    #Verifico se l'utente loggato è lo stesso dell'utente associato al contenuto
    def check_user
      if current_user != @content.user
        redirect_to root_url,alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
