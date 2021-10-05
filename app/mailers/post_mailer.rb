class PostMailer < ApplicationMailer
    def post_mail(user)
        @user = user
        mail to: user.email, subject: "Email de confirmation de la demande"
      end
end
