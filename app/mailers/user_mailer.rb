class UserMailer < MandrillMailer::TemplateMailer
  default :from => "contacto@wamchile.cl"

  def early_access(email,name,url,number_line)
    mandrill_mail template: 'wam-suscribe',
                  subject: "WAM - Request Confirmation",
                  to: {email: email, name: "WAM Support"},
                  vars: {
                      'USER_IDENTIFIER' => email,
                      'COMPANY' => 'PIVOTER',
                      'CURRENT_YEAR' => Time.now.year,
                      'UNIQUE_URL'=>url,
                      'NUMBER_LINE'=>number_line,
                  },
        important: true,
        inline_css: true,
        async: true
  end

  def enviar_invitacion(user, url)
    @user = user
    @url = url
    mail(:to => user.email,:from=> "info@.cl", :subject => t("email_confirmation"))
  end
end
