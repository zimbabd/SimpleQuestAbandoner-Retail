local IsControlKeyDown = IsControlKeyDown

if C_QuestLog and QuestMapLogTitleButton_OnClick and hooksecurefunc then
    hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self, button)
        if button == "RightButton" and IsControlKeyDown() and self.questID
            and C_QuestLog.CanAbandonQuest(self.questID) then
            C_QuestLog.SetSelectedQuest(self.questID)
            C_QuestLog.SetAbandonQuest()
            C_QuestLog.AbandonQuest()
            CloseMenus()
        end
    end)
end

print("|cff00ff00Simple Quest Abandoner:|r Loaded! Hold Ctrl and right-click a quest to abandon.")
