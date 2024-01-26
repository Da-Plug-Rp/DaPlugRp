Shared = Shared or {}
Shared.Documents = {
	["Subpoena"] = {
		type = "create",
    restriction = {job = {enable = false, jobs = {
      [""] = "all",
      [""] = {0},
    }}, citizenid = {enable = false, id = {
      "",
    }}},
    title = "Subpoena",
    logo = "https://cdn.discordapp.com/attachments/633974153388490753/1030999165485989888/1519800440060-removebg-preview.png",
		from = "UNITED STATES DISTRICT COURT",
		description = "Subpoena Form",
		disclaimer = "SUBPOENA TO PRODUCE DOCUMENTS, INFORMATION, OR OBJECTS OR TO PERMIT INSPECTION OF PREMISES IN A CIVIL ACTION",
    information = {
      { id = "i1", label = "Plaintiff", type = "text_input", placement = "(Name of plaintiff)", required = "true", value = "" },
      { id = "i2", label = "Defendant", type = "text_input", placement = "(Name of defendant)", required = "true", value = "" },
      { id = "i3", label = "Civil Action No.", type = "text_input", placement = "(ID number of civil action)", required = "true", value = "" },
      { id = "i4", label = "To:", type = "text_input", placement = "(Name of person to whom this subpoena is directed)", required = "true", value = "" },
    },
    extended_information = {
      { id = "e1", label = "Place:", type = "text_input", placement = "(Place of document being issued)", required = "true", value = "" },
      { id = "e2", label = "Date and Time:", type = "text_input", placement = "(Time & date of document being issued)", required = "true", value = "" },
		  { id = "e3", label = "Attorney’s Name:", type = "text_input", placement = "(The name of the attorney)", required = "true", value = "" },
      { id = "e4", label = "Other Information:", type = "text_area", placement = "(Add any extra information here)", required = "false", value = "" },
    },
    terms_and_conditions = {
      {label = "Do not ignore this or futher action will be taken." },
		  {label = "This document is an legal document."},
    },
		sign = ""
  },
}
