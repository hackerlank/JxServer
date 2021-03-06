Include("\\script\\activitysys\\config\\2\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click big xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Чi T飊g Gi竛g Sinh"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi韎 thi謚 ho箃 ng Gi竛g Sinh",5} },
		{"AddDialogOpt",	{"Nh薾 C﹜ Th玭g Gi竛g Sinh",2} },
		{"AddDialogOpt",	{"Nh薾 T蕋 Gi竛g Sinh",3} },
		{"AddDialogOpt",	{"фi th祅h ph莕 thng",4} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "nil",
	szName = "get xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSKI_TREE_LIMIT,MAX_GET_TREE_LIMIT,"今天你已经Nh薾 C﹜ Th玭g Gi竛g Sinh了，明天再来吧","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_TREE,MAX_GET_TREE_LIMIT,EVENT_LOG_TITLE,"get xmas tree"} },
		{"ThisActivity:AddTaskDaily",	{TSKI_TREE_LIMIT,MAX_GET_TREE_LIMIT} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "nil",
	szName = "get xmas stocking",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSKI_STOCKING_LIMIT,MAX_GET_STOCKING_LIMIT,"今天你已经Nh薾 T蕋 Gi竛g Sinh了，明天再来吧","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_STOCKING,MAX_GET_STOCKING_LIMIT,EVENT_LOG_TITLE,"get xmas stocking"} },
		{"ThisActivity:AddTaskDaily",	{TSKI_STOCKING_LIMIT,MAX_GET_STOCKING_LIMIT} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "get award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T輈h L辌h n",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N鉵 gi竛g sinh",ITEM_XMAS_HAT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_AWARD,1,EVENT_LOG_TITLE,"exchange award"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "event introduction",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"从2011年12月1日0:00到2011年12月31日24:00，150级以上的大侠（重生不受级别限制）可以参加活动，大侠可以到林安(198,184),凤祥 (198,199),汴京 (213,195), 大理 (202,198), 襄阳(198,201),成都(392,316) 的Чi T飊g Gi竛g SinhNh薾 C﹜ Th玭g Gi竛g Sinh和圣诞袜，大侠可以在城内点击鼠标右键使用圣诞树道具，收到一颗圣诞树，大侠可以使用圣诞果，圣诞灯笼，圣诞钟,圣诞星星来装饰圣诞树，来接收奖品，圣诞果，圣诞灯笼，圣诞果，圣诞钟，圣诞星星可以打在长白山南，裸狼洞，第3层沙漠，莫高窟，进菊洞落下的怪物。每天19:00- 23:00, 大侠可以带着圣诞袜到长白山（襄阳—神秘商人柳乙—长白顶）收集圣诞礼物，礼物会非常有吸引力哦！尤其是在奇珍阁有活动的时间里，还有N鉵 gi竛g sinh物品，大侠可以带着N鉵 gi竛g sinh到Чi T飊g Gi竛g Sinh换取乾坤T輈h L辌h n，此灯威力无双，可以用它来打败饿狼左史，它隐藏在饿狼谷。大侠可以通过各城区的车夫到达饿狼谷，打败饿狼左史可以收到非常丰富的奖品。",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "ServerStart",
	szName = "add big xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"Чi T飊g Gi竛g Sinh",XMAS_BIG_TREE_ID,XMAS_BIG_TREE_POS} },
		{"ThisActivity:CreateAmbienceNpc",	{nil} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "use xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_XMAS_TREE},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskbyTime",	{TSKI_USE_TREE_TIME,60} },
		{"PlayerFunLib:IsFightState",	{0, "Ch� c� th� s� d鬾g t筰 nh鱪g khu v鵦 phi chi課 u."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },
		{"PlayerFunLib:CheckTaskDaily",	{2915,6,"S� d鬾g v藅 ph萴 t gi韎 h筺 ng祔.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{2915,1} },
		{"ThisActivity:UseTree",	{nil} },		
		{"ThisActivity:SetTaskByNowTime",	{TSKI_USE_TREE_TIME} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "use pilidan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2739,-1,-1,-1},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H祅h trang kh玭g "} },
		{"ThisActivity:CheckTaskDaily",	{TSKI_PILIDAN_EXP_LIMIT,MAX_PILIDAN_EXP_LIMIT,"S� d鬾g v藅 ph萴 t gi韎 h筺 ng祔.","<"} },
		{"ELangGuWorld:UseItemKillNpc",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSKI_PILIDAN_EXP_LIMIT,1} },
		{"ThisActivity:UsePiLiDan",	{nil} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "map321 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"321"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_APPLE,1,25} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "map75 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"75"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_LANTERN,1,25} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "map227 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CANDY,1,25} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "map340 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"340"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_BELL,1,25} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "NpcOnDeath",
	szName = "map93 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_STAR,1,25} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "map322 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"322"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_APPLE,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_LANTERN,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CANDY,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_BELL,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_STAR,1,5} },
	},
}
