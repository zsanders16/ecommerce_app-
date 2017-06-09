class NewsletterMailer < ApplicationMailer

 def weekly(args)
    mail subject: args[:subject], to: args[:emails]
  end

  def monthly(args)
    mail subject: args[:subject], to: args[:emails]
  end

  def yearly(args)
    mail subject: args[:subject], to: args[:emails]
  end
  
end
