ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    if Config.Framework.Version == "OLD" then
	    TriggerEvent(Config.Framework.SharedObject, function(obj) ESX = obj end)
	    Citizen.Wait(0)
    elseif Config.Framework.Version == "NEW" then
      ESX = exports["es_extended"]:getSharedObject()
      Citizen.Wait(0)
    end
  end
end)

RegisterNetEvent('ap-documents:client:openDocumentMenu', function()
  if Config.MenuInput.OX then
    local contextOptions = {}
    for k in pairs(Shared.Documents) do
      table.insert(contextOptions,  {
        title = k,
        description = 'Click to make a Document.',
        arrow = true,
        event = 'ap-documents:client:openDocument',
        args = {doc = Shared.Documents[k], type = true}
      })		
    end
	  lib.registerContext({
      id = 'documentMain',
      title = 'Document Types',
      options = contextOptions
    })
	  lib.showContext("documentMain")
  elseif Config.MenuInput.NH then
    local documentMain = {}
    for k in pairs(Shared.Documents) do
      table.insert(documentMain,  {
        header = k,
        context = 'Click to make a Document.',
        server = false,
        event = 'ap-documents:client:openDocument',
        args = {{doc = Shared.Documents[k], type = true}}
      })		
    end
    exports["nh-context"]:ContextMenu(documentMain)
  end
end)

RegisterNetEvent('ap-documents:client:myDocuments', function()
    ESX.TriggerServerCallback('ap-documents:getDocuments', function(db)
      if Config.MenuInput.OX then
        local contextOptions = {}
        for _, v in pairs(db) do
          table.insert(contextOptions,  {
            title = v.name,
            description = v.catergory,
            arrow = true,
            event = 'ap-documents:client:openDocument',
            args = json.decode(v.document)
          })		
        end
        lib.registerContext({
          id = 'myDocument',
          title = 'My Documents',
          options = contextOptions
        })
        lib.showContext("myDocument")
      elseif Config.MenuInput.NH then
        local myDocument = {}
        for _, v in pairs(db) do
          table.insert(myDocument,  {
            header = v.name,
            context = v.catergory,
            server = false,
            event = 'ap-documents:client:openDocument',
            args = json.decode(v.document)
          })		
        end
        exports["nh-context"]:ContextMenu(myDocument)
      end
    end)
end)

RegisterNetEvent('ap-documents:client:showDocumentOptions', function(document, docname, hasCopier, itemMeta)
  if Config.MenuInput.OX then
    local contextOptions = {}
    table.insert(contextOptions, {
      title = "View Document",
      description = "View this document, you will only be able to see this.",
      arrow = true,
      event = 'ap-documents:client:openDocument',
      args = document
    })
    table.insert(contextOptions, {
      title = "Show Document",
      description = "Show this document to people around you, including yourself.",
      arrow = true,
      serverEvent = 'ap-documents:server:showMetaDocument',
      args = document
    })
    if hasCopier then
      table.insert(contextOptions, {
        title = "Reprint Document",
        description = "Use this to make a copy of the document to give to someone else or as a copy.",
        arrow = true,
        serverEvent = 'ap-documents:server:printCopy',
        args = itemMeta
      }) 
    end
    lib.registerContext({
      id = 'showDocs',
      title = "Document: "..docname,
      options = contextOptions
    })  
    lib.showContext("showDocs")
  elseif Config.MenuInput.NH then
    local showDocs = {}
    table.insert(showDocs, {
      header = "View Document",
      context = "View this document, you will only be able to see this.",
      server = false,
      event = 'ap-documents:client:openDocument',
      args = {document}
    })
    table.insert(showDocs, {
      header = "Show Document",
      context = "Show this document to people around you, including yourself.",
      server = true,
      event = 'ap-documents:server:showMetaDocument',
      args = {document}
    })
    if hasCopier then
      table.insert(showDocs, {
        header = "Reprint Document",
        context = "Use this to make a copy of the document to give to someone else or as a copy.",
        server = true,
        event = 'ap-documents:server:printCopy',
        args = {itemMeta}
      }) 
    end
    exports["nh-context"]:ContextMenu(showDocs)
  end
end)

RegisterNetEvent('ap-documents:client:showEmptyDocuments', function(job, citizenid)
  if Config.MenuInput.OX then
    lib.registerContext({
      id = 'DocumentCreation',
      title = "Document Templates",
      options = {
        {
          title = "Unrestricted Documents",
          description = "Here will be all the documents you can create.",
          arrow = true,
          event = 'ap-documents:client:unrestrictedDocuments',
          args = {}
        },
        {
          title = "Restricted Documents",
          description = "Here will be documents assigned to you, for you to create.",
          arrow = true,
          event = 'ap-documents:client:restrictedDocuments',
          args = {
            job = job,
            citizenid = citizenid
          }
        },
      }
    })  
    lib.showContext("DocumentCreation")
  elseif Config.MenuInput.NH then
    local DocumentCreation = {
      {
        header = "Unrestricted Documents",
        context = "Here will be all the documents you can create.",
        server = false,
        event = 'ap-documents:client:unrestrictedDocuments',
        args = {}
      },
      {
        header = "Restricted Documents",
        context = "Here will be documents assigned to you, for you to create.",
        server = false,
        event = 'ap-documents:client:restrictedDocuments',
        args = {{
          job = job,
          citizenid = citizenid
        }}
      },
    }
    exports["nh-context"]:ContextMenu(DocumentCreation)
  end
end)

RegisterNetEvent('ap-documents:client:unrestrictedDocuments', function()
  print("hello")
  if Config.MenuInput.OX then
    local contextOptions = {}
    for k, v in pairs(Shared.Documents) do
      if v.restriction.job.enable == false and v.restriction.citizenid.enable == false then
        table.insert(contextOptions,  {
          title = k,
          description = v.description,
          arrow = true,
          event = 'ap-documents:client:openDocument',
          args = {
            doc = Shared.Documents[k],
            type = true
          }
        })	
      end	
    end
    table.insert(contextOptions,  {
      title = "Back",
      description = "Back to main menu.",
      arrow = true,
      serverEvent = 'ap-documents:server:refreshDocs',
      args = {}
    })	
    lib.registerContext({
      id = 'UnrestrictedDocumentCreation',
      title = "Document Types",
      options = contextOptions
    })  
    lib.showContext("UnrestrictedDocumentCreation")
  elseif Config.MenuInput.NH then
    local UnrestrictedDocumentCreation = {}
    for k, v in pairs(Shared.Documents) do
      if v.restriction.job.enable == false and v.restriction.citizenid.enable == false then
        table.insert(UnrestrictedDocumentCreation, {
          header = k,
          context = v.description,
          server = false,
          event = 'ap-documents:client:openDocument',
          args = {{doc = Shared.Documents[k], type = true}}
        })
      end	
    end
    table.insert(UnrestrictedDocumentCreation,  {
      header = "Back",
      context = "Back to main menu.",
      server = true,
      event = 'ap-documents:server:refreshDocs',
      args = {}
    })	
    exports["nh-context"]:ContextMenu(UnrestrictedDocumentCreation)
  end
end)

RegisterNetEvent('ap-documents:client:restrictedDocuments', function(data)
    local JobType, CitizenType = false, false
    for k, v in pairs(Shared.Documents) do
      if v.restriction.job.enable and checkJob(v.restriction.job.jobs, data.job)  then
        JobType = true
      end
      if v.restriction.citizenid.enable and checkCitizenid(v.restriction.citizenid.id, data) then
        CitizenType = true
      end
    end
    if Config.MenuInput.OX then
      local contextOptions = {}
      if JobType then
        table.insert(contextOptions,  {
          title = "Job Documents",
          description = "You will be able to access your job documents here.",
          arrow = true,
          event = 'ap-documents:client:jobDocs',
          args = data
        })	
      end
      if CitizenType then
        table.insert(contextOptions,  {
          title = "Private Documents",
          description = "You will be able to access your private documents here.",
          arrow = true,
          event = 'ap-documents:client:privateDocs',
          args = data
        })	
      end
      table.insert(contextOptions, {
        title = "Back",
        description = "Back to main menu.",
        arrow = true,
        serverEvent = "ap-documents:server:refreshDocs",
        args = {}
      }) 
      lib.registerContext({
        id = 'RestrictedDocumentCreation',
        title = "Restricted Document Types",
        options = contextOptions
      })  
      lib.showContext("RestrictedDocumentCreation")
    elseif Config.MenuInput.NH then
      local RestrictedDocumentCreation = {}
      if JobType then
        table.insert(RestrictedDocumentCreation,  {
          header = "Job Documents",
          context = "You will be able to access your job documents here.",
          server = false,
          event = 'ap-documents:client:jobDocs',
          args = {data}
        })	
      end
      if CitizenType then
        table.insert(RestrictedDocumentCreation,  {
          header = "Private Documents",
          context = "You will be able to access your private documents here.",
          server = false,
          event = 'ap-documents:client:privateDocs',
          args = {data}
        })	
      end
      table.insert(RestrictedDocumentCreation, {
        header = "Back",
        context = "Back to main menu.",
        server = true,
        event = "ap-documents:server:refreshDocs",
        args = {}
      }) 
      exports["nh-context"]:ContextMenu(RestrictedDocumentCreation)
    end
end)

RegisterNetEvent('ap-documents:client:jobDocs', function(data)
  if Config.MenuInput.OX then
    local contextOptions = {}
    for k, v in pairs(Shared.Documents) do
      if v.restriction.job.enable and checkJob(v.restriction.job.jobs, data.job) then
          table.insert(contextOptions, {
            title = k,
            description = v.description,
            arrow = true,
            event = 'ap-documents:client:openDocument',
            args = {
              doc = Shared.Documents[k],
              type = true
            }
          })   
      end
    end
    table.insert(contextOptions, {
      title = "Back",
      description = "Back to restricted Documents.",
      arrow = true,
      event = 'ap-documents:client:restrictedDocuments',
      args = data
    }) 
    lib.registerContext({
      id = 'JobDocumentsCreate',
      title = "Jobs Document Types",
      options = contextOptions
    })
    lib.showContext("JobDocumentsCreate")
  elseif Config.MenuInput.NH then
    local JobDocumentsCreate = {}
    for k, v in pairs(Shared.Documents) do
      if v.restriction.job.enable and checkJob(v.restriction.job.jobs, data.job) then
          table.insert(JobDocumentsCreate, {
            header = k,
            context = v.description,
            server = false,
            event = 'ap-documents:client:openDocument',
            args = {{
              doc = Shared.Documents[k],
              type = true
            }}
          })   
      end
    end
    table.insert(JobDocumentsCreate, {
      header = "Back",
      context = "Back to restricted Documents.",
      server = false,
      event = 'ap-documents:client:restrictedDocuments',
      args = {data}
    }) 
    exports["nh-context"]:ContextMenu(JobDocumentsCreate)
  end
end)

RegisterNetEvent('ap-documents:client:privateDocs', function(data)
  if Config.MenuInput.OX then
    local contextOptions = {}
    for k, v in pairs(Shared.Documents) do
      if v.restriction.citizenid.enable and checkCitizenid(v.restriction.citizenid.id, data) then
        table.insert(contextOptions, {
          title = k,
          description = v.description,
          arrow = true,
          event = 'ap-documents:client:openDocument',
          args = {
            doc = Shared.Documents[k],
            type = true
          }
        })   
      end
    end
    table.insert(contextOptions, {
      title = "Back",
      description = "Back to restricted Documents.",
      arrow = true,
      event = 'ap-documents:client:restrictedDocuments',
      args = data
    })
    lib.registerContext({
      id = 'PrivateDocumentsCreate',
      title = "Private Document Types",
      options = contextOptions
    })
    lib.showContext("PrivateDocumentsCreate")
  elseif Config.MenuInput.NH then
    local PrivateDocumentsCreate = {}
    for k, v in pairs(Shared.Documents) do
      if v.restriction.citizenid.enable and checkCitizenid(v.restriction.citizenid.id, data) then
        table.insert(PrivateDocumentsCreate, {
          header = k,
          context = v.description,
          server = false,
          event = 'ap-documents:client:openDocument',
          args = {{
            doc = Shared.Documents[k],
            type = true
          }}
        })   
      end
    end
    table.insert(PrivateDocumentsCreate, {
      header = "Back",
      context = "Back to restricted Documents.",
      server = false,
      event = 'ap-documents:client:restrictedDocuments',
      args = {data}
    })
    exports["nh-context"]:ContextMenu(PrivateDocumentsCreate)
  end
end)

showDialog = function(documentTable)
  if Config.DialogInput.OX then
    local dialog = lib.inputDialog("Document Information", {"Document Name", "Document Type"})
    if dialog then
      if dialog[1] ~= nil and dialog[2] ~= nil then
        TriggerServerEvent('ap-documents:server:createDocument', dialog[1], dialog[2], documentTable)
      end
    end
  elseif Config.DialogInput.NH then
    local keyboard, name, doctype = exports["nh-keyboard"]:Keyboard({
			header = "Document Information", 
			rows = {"Document Name", "Document Type"}
		})
	
		if keyboard then
			if name and doctype then
				TriggerServerEvent('ap-documents:server:createDocument', name, doctype, documentTable)
      else
        showDialog(documentTable)
      end
		end
  elseif Config.DialogInput.ZF then
    local dialog = exports['zf_dialog']:DialogInput({
			header = "Document Information",
			rows = {{id = 0, txt = "Document Name"}, {id = 1, txt = "Document Type"}}
		})
		if dialog ~= nil then
			if dialog[1].input ~= nil and dialog[2].input ~= nil then
				TriggerServerEvent('ap-documents:server:createDocument', dialog[1].input, dialog[2].input, documentTable)
      else
        showDialog(documentTable)
      end
		end
  end
end