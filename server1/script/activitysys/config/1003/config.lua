Include("\\script\\activitysys\\config\\1003\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitNpc",	{nil} },
	},
}
tbConfig[2] = 
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "Цnh qu竔 r韙 nguy猲 li謚",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,30131,1,0,0},nExpiredTime=nItemExpiredTime,},1,"5"} },
	},
}
tbConfig[3] = --TongKim1000点
{
	nId = 3,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"EventVuLanBaoHieu\tTongKim1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "20 Hoa H錸g п", 1}},
	},
}
tbConfig[4] = --TongKim3000点
{
	nId = 4,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},40,"EventVuLanBaoHieu\tTongKim3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 Hoa H錸g п", 1}},
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "VuotAi17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},15,"EventVuLanBaoHieu\tVuotAi17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi17", "15 Hoa H錸g п", 1}},
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "VuotAi28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},25,"EventVuLanBaoHieu\tVuotAi28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi28", "25 Hoa H錸g п", 1}},
	},
}
tbConfig[7] = --水贼头领
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "TieuDietThuyTacDauLinh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},10,"EventVuLanBaoHieu\tTieuDietThuyTacDauLinh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDauLinh", "10 Hoa H錸g п", 1}},
	},
}
tbConfig[8] = --水贼大头领
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "TieuDietThuyTacDaiDauLinh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"EventVuLanBaoHieu\tTieuDietThuyTacDaiDauLinh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDaiDauLinh", "20 Hoa H錸g п", 1}},
	},
}
tbConfig[9] = --炎帝
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "VuotAiViemDe10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},30,"EventVuLanBaoHieu\tVuotAiViemDe10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAiViemDe10", "30 Hoa H錸g п", 1}},
	},
}
tbConfig[10] = --世界boss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "TieuDietBossTheGioi",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},50,"EventVuLanBaoHieu\tTieuDietBossTheGioi"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossTheGioi", "50 Hoa H錸g п", 1}},
	},
}
tbConfig[11] = --杀手boss
{
	nId = 11,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},5,"EventVuLanBaoHieu\tTieuDietBossS竧Th�"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossSatThu", "5 Hoa H錸g п", 1}},
	},
}
----add 对话npc
tbConfig[12] = --Chng Жng Cung N鞫曰�
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 Chng Жng Cung N�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chng Жng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu鑞 i C鰑 Ti猲 Ng� Y課",13} },		
	},
}
----合成原料
tbConfig[13] = --фi C鰑 Ti猲 Ng� Y課
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "фi C鰑 Ti猲 Ng� Y課",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C鰑 Ti猲 Ng� Y課",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"AddOneMaterial",	{"Hoa H錸g п",{tbProp={6,1,30132,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRoseBud", {nil}},		
	},
}
tbConfig[14] = --对话M鬰 Ki襲 Li猲
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 M鬰 Ki襲 Li猲",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M鬰 Ki襲 Li猲"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"GhepThuyTuuHoTien",15} },
		{"AddDialogOpt",	{"T苙g Hoa H錸g п",16} },
		{"AddDialogOpt",	{"T苙g C鰑 Ti猲 Ng� Y課",18} },
	},
}
tbConfig[15] = --фi Th髖 T鵸 H� Ti猲
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "фi Th髖 T鵸 H� Ti猲",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Th髖 T鵸 H� Ti猲",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"AddOneMaterial",	{"Hoa H錸g п",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},5} },
		{"AddOneMaterial",	{"C鰑 Ti猲 Ng� Y課",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"H秈 V� B錸g Lai",{tbProp={6,1,30129,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30130,1,0,0},nExpiredTime=nItemExpiredTime,},1,"EventVuLanBaoHieu\tGhepThuyTuuHoTien"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "GhepThuyTuuHoTien", "1 Th髖 T鵸 H� Ti猲", 1}},
	},
}
tbConfig[16] = --送玫瑰
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "T苙g Hoa H錸g п",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>T苙g Hoa H錸g п",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"AddOneMaterial",	{"Hoa H錸g п",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"ThisActivity:CheckGiveRedRoseLimit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRose", {nil}},
	},
}
tbConfig[17] = --S� d鬾g Th髖 T鵸 H� Ti猲
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Th髖 T鵸 H� Ti猲",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30130,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , kh玭g th� s� d鬾g v藅 ph萴",">="} },
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:TTHT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_TTHT", {nil}},		
	},
}
tbConfig[18] = --T苙g C鰑 Ti猲 Ng� Y課
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "T苙g C鰑 Ti猲 Ng� Y課",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>T苙g C鰑 Ti猲 Ng� Y課",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"ThisActivity:GiveCuuTienLimit", {nil}},
		{"AddOneMaterial",	{"C鰑 Ti猲 Ng� Y課",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:GiveCuuTien", {nil}},
	},
}