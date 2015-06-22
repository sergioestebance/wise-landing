class WelcomeController < ApplicationController

  def index
    @visita = Visita.new
  end

  def create
    # @visita = Visita.new(params[:visita])
    # @visita.ip = request.remote_ip
    # @visita.referral_id = Digest::MD5.hexdigest(@visita.email)
    @obj = params[:visita]
    referral_url=Digest::MD5.hexdigest(@obj[:email])
    respond_to do |format|
      if UserMailer.early_access(@obj[:email],@obj[:name],referral_url,138).deliver
        format.js { render json: {:message => "Congratulations! The email has been sent to #{@obj[:email]}!", :layout => false}, status: :created }
      end
    end

 #   respond_to do |format|
 #     if @visita.save
 #       url=request.protocol + request.host + '?ref='+@visita.referral_id
 #       number_line = @visit.id + 136
 #       UserMailer.early_access(@visita, url,number_line).deliver
#
#        format.html { redirect_to @visita, notice: 'Visit was successfully created.' }
#        format.js { render json: {:page => render_to_string(partial: 'welcome/mensaje', :locals => { :user => @visita, :url => url }), :layout => false}, status: :created }
#      end
#    end

  end

end

