interact = {}

--
-- Second Screen
--

--Lines one and two. Make sure each line is less than 70 characters, or they will run off the screen.
interact.s2_l1 = "Welcome to Craig's Server!"
interact.s2_l2 = "Would you like to build or just look around first?"
--The buttons. These ones can have a maximum of 26 characters.
interact.s2_b1 = "I'd like to build"
interact.s2_b2 = "I'd like to look around"

--The message the player is sent if s/he is just visiting.
interact.s2_visit_msg = "Have a nice time looking around! Type /rules if you change your mind."

--
-- Third Screen
--

--The header for the rules box, this can have 60 characters, max.
interact.s3_header = "These are the rules, do you agree to them?"

--The actual rules.
interact.s3_rules = [[
1. Don't attempt to crash, lag, damage, disable or exploit the server or game.
2. No stealing or greifing (damaging creations of others) 
3. No harassing (e.g. asking for stuff/privileges constantly)
4. No PVP (punching others) unless the players taking part agree
5. Don't use multiple accounts or impersonate another account
6. No play dating or family role-play. Seriously, not cool
7. Feel free to walk around anywhere unless the area is clearly private
8. Please avoid making a mess of the landscape. Nice buildings are always welcome :)

Failure to follow these rules may result in sanctions.
]]

--The buttons. Each can have 15 characters, max.
interact.s3_b1 = "I agree :)"
interact.s3_b2 = "I disagree :("

--The messages send to the player after interact is granted.
interact.s3_interact_msg1 = "Thanks for accepting the rules, you now are able to interact (build)."
interact.s3_interact_msg2 = "Happy building!"

--The message to send players who disagree when they are kicked for disagring with the rules.
interact.s3_disagree_msg = "Sorry, you have to agree in order to interact (build). Type /rules if you change your mind."
