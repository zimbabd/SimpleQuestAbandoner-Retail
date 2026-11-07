local IsControlKeyDown = IsControlKeyDown

if C_QuestLog and QuestMapLogTitleButton_OnClick and hooksecurefunc then
    hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self, button)
        if button == "LeftButton" and IsControlKeyDown() and self.questID
            and C_QuestLog.CanAbandonQuest(self.questID) then
            C_QuestLog.SetSelectedQuest(self.questID)
            C_QuestLog.SetAbandonQuest()
            C_QuestLog.AbandonQuest()
            CloseMenus()
        end
    end)
elseif SelectQuestLogEntry and SetAbandonQuest and AbandonQuest then
    local originalOnClick = QuestLogTitleButton_OnClick

    function QuestLogTitleButton_OnClick(self, button, down)
        if button == "LeftButton" and IsControlKeyDown() and not self.isHeader then
            local questIndex = self:GetID()
            if questIndex then
                SelectQuestLogEntry(questIndex)
                SetAbandonQuest()
                AbandonQuest()
            end
            return
        end

        if originalOnClick then
            return originalOnClick(self, button, down)
        end
    end
end

print("|cff00ff00Simple Quest Abandoner:|r Loaded! Hold Ctrl and left-click a quest to abandon.")