class NewsletterController < ApplicationController
  def new
  end

  def create
    # params[:emails] comes in from the form as whatever the user types in
    # params[:subject] comes in from the form as whatever the user types in
    #   this is going to be used to set the subject in the mailer
    # params[:newsletter] comes in from the form as: 'weekly', 'monthly', 'yearly'
    NewsletterJob.perform_later({
                                 emails: params[:emails],
                                 subject: params[:subject],
                                 newsletter: params[:newsletter]
                                })
    flash[:success] = 'Newsletter Sent!'
    redirect_to new_newsletter_path
  end
end
