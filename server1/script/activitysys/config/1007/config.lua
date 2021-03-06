Include("\\script\\activitysys\\config\\1007\\variables.lua")
tbConfig = {}

--活动中寻找原料的方法
tbConfig[1] = --TongKim1000点
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 1000 甶觤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "TongKim1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "20 Ho祅g Th筩h", 1}},
	},
}

tbConfig[2] = --TongKim3000点
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 3000 甶觤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},40,"Event_PNVN", "TongKim3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 Ho祅g Th筩h", 1}},
	},
}

tbConfig[3] =		--Vt qua 秈 17
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "Vt qua 秈 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},15,"Event_PNVN", "Vt qua 秈 17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Vt qua 秈 17", "15 Ho祅g Th筩h", 1}},
	},
}

tbConfig[4] =  				--VuotAi28
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "Vt qua 秈 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "VuotAi28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi28", "30 Ho祅g Th筩h", 1}},
	},
}

tbConfig[5] = --水贼头领
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "Gi誸 ch誸 1 th駓 t芻 u l躰h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "Gi誸 ch誸 1 th駓 t芻 u l躰h"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Gi誸 ch誸 1 th駓 t芻 u l躰h", "20 Ho祅g Th筩h", 1}},
	},
}

tbConfig[6] = --水贼大头领
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Ti猽 di謙 thu� t芻 i u l躰h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "Ti猽 di謙 thu� t芻 i u l躰h"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Ti猽 di謙 thu� t芻 i u l躰h", "30 Ho祅g Th筩h", 1}},
	},
}

tbConfig[7] = --炎帝- 闯关10
{
	nId = 7,
	szMessageType = "YDBZguoguan",
	szName = "Vt qua 秈 Vi猰 д th� 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "Vt qua 秈 Vi猰 д th� 10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Vt qua 秈 Vi猰 д th� 10", "30 Ho祅g Th筩h", 1}},
	},
}
tbConfig[8] = --黄金boss
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Ti猽 di謙 boss Ho祅g Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "Ti猽 di謙 boss Ho祅g Kim"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Ti猽 di謙 boss Ho祅g Kim", "30 Ho祅g Th筩h", 1}},
	},
}
tbConfig[9] = --杀手boss
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Nhi謒 v� s竧 th� c蕄 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_PNVN", "TieuDietBossS竧Th�"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossS竧Th�", "5 Ho祅g Th筩h", 1}},
	},
}

---与Npc对话
tbConfig[10] =
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 Ti觰 Phng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti觰 Phng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N閜 Ho祅g Th筩h",12} },
		{"AddDialogOpt",	{"H頿 th祅h B╪g Tinh Th筩h",11} },
	},
}

tbConfig[11] = --H頿 th祅h B╪g Tinh Th筩h
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h B╪g Tinh Th筩h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B╪g Tinh Th筩h",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi ch璦  150, kh玭g th� tham gia ho箃 ng n祔",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"Ho祅g Th筩h",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Thi猲 Tinh Th筩h",{tbProp={6,1,30154,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30155,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_PNVN", "GhepBangTinhThach"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "H頿 th祅h B╪g Tinh Th筩h", "1 B╪g Tinh Th筩h", 1}},
	},
}

tbConfig[12] = --N閜 Ho祅g Th筩h物品
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "N閜 Ho祅g Th筩h物品",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N閜 Ho祅g Th筩h物品",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi ch璦  150, kh玭g th� tham gia ho箃 ng n祔",">="} },
		{"ThisActivity:HandInHoangThachLimit", {nil}},
		{"AddOneMaterial",	{"Ho祅g Th筩h",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:HandInHoangThach", {nil}},
	},
}

tbConfig[13] = --S� d鬾g B╪g Tinh Th筩h
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B╪g Tinh Th筩h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30155,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , kh玭g th� s� d鬾g v藅 ph萴",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"ThisActivity:UseBTT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_BTT", {nil}},		
	},
}
