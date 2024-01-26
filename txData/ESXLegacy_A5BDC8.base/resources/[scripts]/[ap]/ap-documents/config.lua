Config = {
  Framework = {Version = "NEW", SharedObject = "esx:getSharedObject"}, -- If your using 1.1/1.2/V1 Final then set Version to "OLD" or if using esx legacy then set Version to "NEW".
  OldESX = false, -- Use this if you don't use legacy.
  Debug = false, -- sends prints to the server console.
  Inventory = {OX = true, MF = false, QS = false, Other = false}, -- OX; Ox Inventory, MF; ModFreaks Inventory, QS; Quasar Inventory, Other; Add support to a differnt inventory.
  MenuInput = {OX = true, NH = false}, -- OX; Ox Libs, NH; NH Context.
  DialogInput = {OX = true, NH = false, ZF = false}, -- OX; Ox Libs, NH; NH Keyboard, ZF; ZF Dialog.
  UseItem = {
	MetaData = true, -- DO NOT TOUCH
	DocumentItem = {
	  item = "document", 
	  label = "Document",
	}, 
	CreateDocument = {
	  item = "emptydocuments", 
	  label = "Blank Documents",
	},
	PortableDocumentCopier = {
	  item = "portablecopier", 
	  label = "Portable Document Copier",
	},
  }
}