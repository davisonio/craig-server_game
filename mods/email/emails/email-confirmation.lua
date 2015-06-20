function email.email_email_confirmation()
	local message = {
		headers = {
			to = 'CraigyDavi <craig.davison3@gmail.com>',
			subject = "This is a test"
		},
		body = name .." this is just a test!\n"..
			"\n"..
			"Sent from Minetest."
	}
	email.send("email-email-confirmation","<craig@davison.io>", "<craig.davison3@gmail.com>", message)
end
