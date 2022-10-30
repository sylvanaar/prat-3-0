--[[ BEGIN STANDARD HEADER ]] --

-- Imports
local _G = _G
local SVC_NAMESPACE = select(2, ...)
-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]] --

function ChatEdit_SetDeactivated(editBox)
  editBox:SetFrameStrata("LOW");
  if ( editBox.disableActivate or _G.GetCVar("chatStyle") == "classic" and not editBox.isGM ) then
    editBox:Hide();
  else
    editBox:SetText("");
    editBox.header:Hide();
    editBox.prompt:Show();
    if ( not editBox.isGM ) then
      editBox:SetAlpha(0.35);
    end
    editBox:ClearFocus();

    _G.ChatEdit_ResetChatTypeToSticky(editBox);
    _G.ChatEdit_ResetChatType(editBox);
  end
  _G[editBox:GetName().."Language"]:Hide();
end