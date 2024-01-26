Config = {
	Framework = { ESX = "legacy", -- Set this too the version of ESX that you use, EXAMPLE 'legacy' or 'v1.2' or 'v1final' or 'v1.1'.
	  getSharedObject = "esx:getSharedObject", -- Leave this if you don't have a custom getSharedObject.
	  FrameworkExport = "es_extended" -- Leave this if you have not changed the name of your core file.
	},
	DiscordWebhook = {ApplicationSubmission = true, JobInterview = true, JobOfferGiven = true, AppointmentRequest = true, AppointmentApprove = true, ReceptionStaff = true}, -- Set the webhooks you want to use to true.
	Phone = {GKSPhone = false, GCPhone = false, QuasarPhone = true, HighPhone = false, LBPhone = false, Custom = false}, -- Set to the phone you use to true, if you do not have one of these phones then set Custom to true and edit the function in webhooks.lua.
	Interactions = {fivem_target = false, qTarget = false, OX = true}, -- Set the target system to true that you use.
	Context = {OX = true, NH = false},
	Dialog = {OX = true, Other = false},
	DefaultJobLogo = "https://cdn.discordapp.com/attachments/633974153388490753/1108496766992666704/logo.png"
}

Config.DefaultPedModel = "a_m_y_business_02"

Config.JobApplicationForm = {
  title = "JOB APPLICATION FORM",
  description = "APPLICATION FOR EMPLOYMENT",
  information = {
    [1] = "APPLICANT NAME:", [2] = "APPLICATION DATE:", [3] = "COMPANY:", [4] = "POSITION APPLYING FOR:"
  }
}

Config.StartingQuestions = {
  [1] = "Why do you want to work for us?", 
  [2] = "How well do you understand the industry/job?", 
  [3] = "What are your hobbies?",
  [4] = "What positions of responsibility have you held/Give an example of when you have shown leadership.", 
  [5] = "Why are you the best candidate for the job?",
  [6] = "Have you ever been convicted of a crime?"
}

Config.PhoneSettings = {
  appointment_notify = {
	title = "Mail",
	msg = "Email received from %s",
	sender = "%s",
	subject = "Appointment",
	image = "/html/static/img/icons/mail.png",
	mail = "Dear %s, <br /><br /> You are receiving this email as your appointment has been scheduled for %s at %s. <br /><br /> please make sure you turn up for your appointment 5 minutes before the scheduled time.<br /><br /> Regards,<br /><br /> %s<br />",
	--HIGH PHONE ONLY BELOW 
	email = "%s@company.com",
	photo = "",
	photoattachment = ""
  },
  appointment_cancel = {
	title = "Mail",
	msg = "Email received from %s",
	sender = "%s",
	subject = "Appointment",
	image = "/html/static/img/icons/mail.png",
	mail = "Dear %s, <br /><br /> You are receiving this email as your appointment has been canceled. <br /><br /> Regards,<br /><br /> %s<br />",
	--HIGH PHONE ONLY BELOW 
	email = "%s@company.com",
	photo = "",
	photoattachment = ""
  },
  interview_notify = {
	title = "Mail",
	msg = "Email received from %s",
	sender = "%s",
	subject = "Job Interview",
	image = "/html/static/img/icons/mail.png",
	mail = "Dear %s, <br /><br /> Congratulations, you have been offered an interview on %s.<br /><br /> Please make sure you arrive 10 mintues before the scheduled time. If you belive you cant make the interview then vist the job workplace and make an appointment stating dates you will be available. <br /><br /> Regards,<br /><br /> %s<br />",
	--HIGH PHONE ONLY BELOW 
	email = "%s@company.com",
	photo = "",
	photoattachment = ""
  },
  interview_date_change = {
	title = "Mail",
	msg = "Email received from %s",
	sender = "%s",
	subject = "Job Interview",
	image = "/html/static/img/icons/mail.png",
	mail = "Dear %s, <br /><br /> The date for your job interview has changed to %s.<br /><br /> Please make sure you arrive 10 mintues before the scheduled time. If you belive you cant make the interview then vist the job workplace and make an appointment stating dates you will be available. <br /><br /> Regards,<br /><br /> %s<br />",
	--HIGH PHONE ONLY BELOW 
	email = "%s@company.com",
	photo = "",
	photoattachment = ""
  },
  application_decline = {
	title = "Mail",
	msg = "Email received from %s",
	sender = "%s",
	subject = "Job Application",
	image = "/html/static/img/icons/mail.png",
	mail = "Dear %s, <br /><br /> Thank you for applying to work at %s. After thoughtful consideration, we have decided to move forward with another candidate. <br /><br /> We thank you for your interest in the company and wish you the best of luck in your job search. <br /><br /> Regards,<br /><br /> %s<br />",
	--HIGH PHONE ONLY BELOW 
	email = "%s@company.com",
	photo = "",
	photoattachment = ""
  },
  application_hire = {
	title = "Mail",
	msg = "Email received from %s",
	sender = "%s",
	subject = "Offer Of Employment",
	image = "/html/static/img/icons/mail.png",
	mail = "Dear %s, <br /><br /> Thank you for applying to work at %s. After thoughtful consideration, we have decided to offer you the position of %s. <br /><br /> To start your employment please vist the reception where you made the application and you can start the job there. <br /><br /> Regards,<br /><br /> %s<br />",
	--HIGH PHONE ONLY BELOW 
	email = "%s@company.com",
	photo = "",
	photoattachment = ""
  }
}