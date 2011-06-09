local registry = {}

function Prat:RegisterDropdownButton(name, callback)
  registry[name] = callback or true
end




local function showMenu(dropdownMenu, which, unit, name, userData, ...)
  for i=1,UIDROPDOWNMENU_MAXBUTTONS do
    local button = _G["DropDownList" .. UIDROPDOWNMENU_MENU_LEVEL .. "Button" .. i];

    local f = registry[button.value]
    -- Patch our handler function back in
    if f then
      button.func = UnitPopupButtons[button.value].func
      if type(f) == "function" then
        f(dropdownMenu, button)
      end
    end
  end
end

hooksecurefunc("UnitPopup_ShowMenu", showMenu)