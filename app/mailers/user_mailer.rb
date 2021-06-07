class UserMailer < ApplicationMailer

	def send_mail(event, member)
	  @event = event
	  mail from: 'owner@example.com', bcc: member.pluck(:email), subject: "#{event.title}"
	end

end
