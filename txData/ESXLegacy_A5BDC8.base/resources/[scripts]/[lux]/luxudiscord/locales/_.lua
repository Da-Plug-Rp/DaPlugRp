Locales = {}

function Locale(key)
      local lang = Locales[Config.Locale]
      if not lang then return "Lang Doesn't Exist" end
      return lang[key] or key
end

exports('GetLocales', function()
      return Locales
end)
