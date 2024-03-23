Locales = {}

function _(str, ...)  -- Translate string

	if Locales[Config.Locale] ~= nil then

		if Locales[Config.Locale][str] ~= nil then
			return string.format(Locales[Config.Locale][str], ...)
		else
			return 'La traduction [' .. Config.Locale .. '][' .. str .. '] n\'éxiste pas!'
		end

	else
		return 'la traduction [' .. Config.Locale .. '] n\'éxiste pas!'
	end

end

function _U(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end
