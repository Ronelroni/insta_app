class PostMailer < ApplicationMailer
    def post_mail(post)
        @post = post
        mail to: "ronelroni01@gmail.com", subject: "Email de confirmation de la demande"
      end
end
