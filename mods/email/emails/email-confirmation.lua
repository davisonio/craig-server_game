function email.email_email_confirmation()
	local message = {
		headers = {
			from = "Craig's Server <craig@davison.io>",
			to = welcome.player_name.." <"..welcome.player_email..">",
			subject = "Thanks for adding your email"
		},
		body = "Hello "..welcome.player_name..",\n"..
			"\n"..
			"Thanks for adding an email to your account on Craig's Minetest Server.\n"..
			"\n"..
			"Now, if you ever have trouble accessing the world you can send a message to craig@davison.io and have your password reset."..
			"\n"..
			"If you have any questions, feel free to reply to this email.\n"..
			"\n"..
			"Happy building!"
	}
	email.send("email-email-confirmation", "<"..welcome.player_email..">", message)
end
