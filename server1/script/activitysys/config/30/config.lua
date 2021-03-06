Include("\\script\\activitysys\\config\\30\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "高级宋金积分大于1000且小于3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveSongjinAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "TongKim1000NhanCayBut"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TongKim1000", "C﹜ B髏", 1}},
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "高级宋金积分大于3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveSongjinAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "TongKim3000NhanCayBut"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TongKim3000", "C﹜ B髏", 1}},
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "高级闯关过17关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{17} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "闯关17获得C﹜ B髏"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAi17", "C﹜ B髏", 1}},
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "高级闯关过28关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{28} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "VuotAi28获得C﹜ B髏"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAi28", "C﹜ B髏", 1}},
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishKillerBoss",
	szName = "高级蒀﹜ B髏謆oss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveShashouAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},2,"Event_NhaGiaoVN", "消灭蒀﹜ B髏諦ossSat获得C﹜ B髏"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossSatThu", "C﹜ B髏", 1}},
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
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
		--{"ThisActivity:GiveYDBZAward",	{10} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},15,"Event_NhaGiaoVN", "VuotAiViemDe10获得C﹜ B髏"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAiViemDe10", "C﹜ B髏", 1}},
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "野外打怪掉落Gi蕐 Tr緉g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,3039,1,0,0},nExpiredTime=20111201,},1,"5"} },		
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "ServerStart",
	szName = "服务器启动时加载npc",
	nStartDate = 201111010000,
	nEndDate  = 201112010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡水贼头领",
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
		--{"ThisActivity:GiveFenglinduAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},5,"Event_NhaGiaoVN", "TieuDietThuyTacDauLinh获得C﹜ B髏"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietThuyTacDauLinh", "C﹜ B髏", 1}},
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡水贼大头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveFenglinduAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "TieuDietThuyTacDaiDauLinh获得C﹜ B髏"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietThuyTacDaiDauLinh", "C﹜ B髏", 1}},
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "黄金boss",
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
		--{"ThisActivity:GiveGoldBossAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "消灭世界Boss获得C﹜ B髏"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossTheGioi", "C﹜ B髏", 1}},
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "点击Чi L穙 S�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Чi L穙 S�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"Giao n閜 Cu鑞 S竎h",13} },
		{"AddDialogOpt",	{"Nh薾 ph莕 thng ng祔 nh� gi竜",14} },
		--{"AddDialogOpt",	{"Nh薾 у Ph� Kim �",15} },
		{"SetDialogTitle",	{"每年教师节又到了，各位大侠可以通过上交<color=yellow> Cu鑞 S竎h <color> 给我将获得奖励，如果上交次数达到700次，依然可以收到一些金乌图谱。同时，在2011年11月20日，可以到我这里领取Event_NhaGiaoVN礼品，每人只能领取一次，不要忘记那天哦。"} },
	},
}
--tbConfig[13] = --一个细节
--{
--	nId = 13,
--	szMessageType = "nil",
--	szName = "Giao n閜 Cu鑞 S竎h籍",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {nil},
--	tbCondition = 
--	{
--		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
--	},
--	tbActition = 
--	{
--		{"ThisActivity:HandInBook",	{nil} },
--	},
--}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Cu鑞 S竎h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3042,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"ThisActivity:CheckBookLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBook",	{nil} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng ng祔 nh� gi竜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_TeacherAward,0,"Ngi  nh薾 ph莕 thng n祔 r錳, kh玭g th� nh薾 n鱝","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:TeacherAward",	{nil} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "nil",
	szName = "Nh薾 у Ph� Kim �",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_JinwuAward,0,"Ngi  nh薾 ph莕 thng n祔 r錳, kh玭g th� nh薾 n鱝","=="} },
		{"ThisActivity:CheckTask",	{TSK_HandInBook,700,"S� lng Cu鑞 S竎h m� i hi謕 giao n閜 ch璦  700 l莕, kh玭g th� nh薾 ph莕 thng.",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:JinwuAward",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "点击Th� уng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th� уng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giao n閜 Gi蕐 Tr緉g",17} },
		{"AddDialogOpt",	{"H頿 th祅h Cu鑞 S竎h",18} },
		{"SetDialogTitle",	{"大侠! 有<color=yellow> Gi蕐 Tr緉g<color> 吗, 给我吧，我将给你相应的奖励。跟你说一个秘密，使用<color=yellow> 5 张Gi蕐 Tr緉g，一支C﹜ B髏，一瓶L� M鵦 <color> juice可以合成一本 <color=yellow> 书 <color>, 拿Cu鑞 S竎h上交给<color=yellow> 我旁边的Чi L穙 S�<color> 将收到宝贵奖励。和你小声说吧，Gi蕐 Tr緉g可以到 <color=yellow> 长白山南，长白山北，裸狼洞，沙漠山洞3，莫高窟，进菊洞 <color> 打怪掉落，而C﹜ B髏则可以通过参加各种性能活动获得，L� M鵦可以在 <color=yellow> 奇珍阁找到<color>, 不要弄错了哦"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "nil",
	szName = "Giao n閜 Gi蕐 Tr緉g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandInPaper",	{nil} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h Cu鑞 S竎h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Cu鑞 S竎h",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Gi蕐 Tr緉g",{tbProp={6,1,3039,1,0,0},},5} },
		{"AddOneMaterial",	{"C﹜ B髏",{tbProp={6,1,3040,1,0,0},},1} },
		{"AddOneMaterial",	{"L� M鵦",{tbProp={6,1,3041,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3042,1,0,0},nExpiredTime=20111201,},1,"Event_NhaGiaoVN","GhepCuonSach"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Hoa Tri ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3043,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedZhienhua,nMaxZhienhua,"Th藅 ng ti誧 hi謓 t筰 s� l莕 s� d鬾g  , kh玭g th� s� d鬾g 頲 n鱝","<"} },
		{"ThisActivity:CheckTask",	{TSK_HandInPaper,nMaxPaperCount,format("目前Giao n閜 Gi蕐 Tr緉g数量未达到%s, 不能使用",nMaxPaperCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhienhua",	{nil} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Thi猲 V� H錸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3044,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedTianyuhun,nMaxTianyuhun,"Th藅 ng ti誧 hi謓 t筰 s� l莕 s� d鬾g  , kh玭g th� s� d鬾g 頲 n鱝","<"} },
		--{"ThisActivity:CheckTask",	{TSK_HandInBook,nMaxBookCount,format("目前Giao n閜 Cu鑞 S竎h籍数量未达到%s, 不能使用",nMaxBookCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseTianyuhun",	{nil} },
	},
}
