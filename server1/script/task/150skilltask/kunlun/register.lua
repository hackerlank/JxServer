Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\kunlun\\kunlun.lua")
--150级技能任务开启 - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "C玭 L玭"
pTask.m_nTaskId = 10
pTask.m_nBase = 1
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
