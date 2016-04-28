Include("\\script\\activitysys\\config\\32\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "��i tho�i V� L�m Minh Ch�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nam Cung Nh�t Thi�n"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nhi�m v� V� L�m Minh Ch�",2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "Nhi�m v� h�ng ng�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"'Hi�p Chi ��i Gi�, V� N��c V� D�n'. L�n n�y ta ph�ng m�nh s� ph�, ��n ��y �� t�m c�c ch� v� anh h�ng h�o ki�t. S� ph� ta n�i r�ng ch� c�n ch�ng ta ��ng t�m hi�p l�c, �t s� c� 1 ng�y s� ��nh �u�i ���c Th�t T�. No� ng��i c� ph�i l� ng��i m� ta mu�n t�m kh�ng?",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������Nhi�m v� V� L�m Minh Ch�",3} },
		{"AddDialogOpt",	{"Ta ��n nh�n th��ng nhi�m v�",4} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "������Nhi�m v� h�ng ng�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"120�����ϻ����������Ĵ���ÿ����Ե��������Nhi�m v� V� L�m Minh Ch�ÿ������ÿ��������һ�Σ���ɺ��ҽ�������Ӧ�Ľ���!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh�n nhi�m v� gi�t qu�i",5} },
		{"AddDialogOpt",	{"Nh�n nhi�m v� ��i tho�i",6} },
		{"AddDialogOpt",	{"Nh�n nhi�m v� thu th�p",7} },
		{"AddDialogOpt",	{"Ta kh�ng c�n th�n l�m m�t th� c�a ng��i r�i",11} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "Ta ��n nh�n th��ng nhi�m v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"120�����ϻ����������Ĵ���ÿ����Ե��������Nhi�m v� V� L�m Minh Ch�ÿ������ÿ��������һ�Σ���ɺ��ҽ�������Ӧ�Ľ���!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh�n ph�n th��ng nhi�m v� gi�t qu�i",8} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng nhi�m v� ��i tho�i",9} },
		{"AddDialogOpt",	{"Nh�n ph�n th��ng nhi�m v� thu th�p",10} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "Nh�n nhi�m v� gi�t qu�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptKillTask",	{nil} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "Nh�n nhi�m v� ��i tho�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptTalkTask",	{nil} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "Nh�n nhi�m v� thu th�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptGatherTask",	{nil} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng nhi�m v� gi�t qu�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletKillTask",	{nil} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng nhi�m v� ��i tho�i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletTalkTask",	{nil} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "Nh�n ph�n th��ng nhi�m v� thu th�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletGatherTask",	{nil} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "nil",
	szName = "Ta kh�ng c�n th�n l�m m�t th� c�a ng��i r�i��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_ID,0,"��λ<lua GetSex() == 1 and \"���\" or \"���\"/> �һ�����Ҫ���������",">"} },
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_STATE,0,"��λ<lua GetSex() == 1 and \"���\" or \"���\"/> ���Ѿ��������ŵ����ˣ����Ǹ�л","=="} },
		{"PlayerFunLib:CheckItemInPlayer",	{{tbProp={6,1,2571,1,-1,0},},1,"��λ<lua GetSex() == 1 and \"���\" or \"���\"/> �������ϻ�������Ĵ��������Ѿ����ҵ����ˣ�������ϸ����." } },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2571,1,0,0},},1,"Nh�n l�i th� c�a Long Nhi",""} },
		{"Talk",	{1,"","���c r�i , v�y �� ta vi�t l�i cho ng��i, c�ng nh� l� luy�n ch� th�i m�."} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "��i tho�i T�ng Kim Ti�u K� Nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti�u K� Nhi"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ��n trao th� cho ng��i",15} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "��i tho�i Ph�ng Ph�ng v��t �i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ph�ng Ph�ng"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ��n trao th� cho ng��i",15} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "��i tho�i Ti�u Chi�u Phong L�ng ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti�u Chi�u"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ��n trao th� cho ng��i",15} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "nil",
	szName = "Ta ��n trao th� cho ng��i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:TalkToNpc",	{nil} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ServerStart",
	szName = "Kh�i ��ng sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Init",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "��i tho�i Ti�u Tr�n Thi�n B�o Kh�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti�u Tr�n"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ��n trao th� cho ng��i",15} },
	},
}
