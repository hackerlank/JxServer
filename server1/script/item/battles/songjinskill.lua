
-- 宋金特殊技能
-- by Bel
-- 2008.03.06

Include("\\script\\lib\\common.lua");

sjskill_tbSkill = {
	[462]	= {nLevel_Low = 2,	nLevel_High = 10,	nTime = 60,	szTips = "Li猲 ti誴 %s h錳 ph鬰 sinh m謓h %d 甶觤"},
	[463]	= {nLevel_Low = 2,	nLevel_High = 10,	nTime = 60, szTips = "Li猲 ti誴 %s h錳 ph鬰 n閕 l鵦 %d 甶觤"},
	[464]	= {nLevel_Low = 1,	nLevel_High = 10,	nTime = 60, szTips = "Li猲 ti誴 %s h錳 ph鬰 sinh m謓h , m鏸 n鯽 gi﹜ h錳 ph鬰 %d 甶觤"},
	[465]	= {nLevel_Low = 1, 	nLevel_High = 10,	nTime = 60, szTips = "Li猲 ti誴 %s h錳 ph鬰 n閕 l鵦 , m鏸 n鯽 gi﹜ h錳 ph鬰 %d 甶觤"},
	[466]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi秏 s竧 thng: %d%%"},
	[467]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi秏 tr髇g c: %d%%"},
	[468]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi秏 l祄 ch薽: %d%%"},
	[469]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi秏 cho竛g: %d%%"},
	[471]	= {nLevel_Low = 2, 	nLevel_High = 10,	nTime = 60, szTips = "Li猲 ti誴 %s h錳 ph鬰 sinh m謓h %d 甶觤以及连续%s 恢复内力 %d 点"},
	[472]	= {nLevel_Low = 1, 	nLevel_High = 10,	nTime = 60, szTips = "Li猲 ti誴 %s h錳 ph鬰 sinh m謓h , m鏸 n鯽 gi﹜ h錳 ph鬰 %d 甶觤 v� li猲 ti誴 %s h錳 ph鬰 n閕 l鵦 , m鏸 n鯽 gi﹜ h錳 ph鬰 %d 甶觤"},
	[473]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s ph遪g th�: t╪g %d%%"},
	[474]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh竛g c:  t╪g %d%%"},
	[475]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh竛g b╪g: t╪g %d%%"},
	[476]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh竛g h醓: t╪g %d%%"},
	[477]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh竛g l玦: t╪g %d%%"},
	[478]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s kh竛g t蕋 c�: t╪g %d%%"},
	[479]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s h� n閕 c玭g s竧 thng b譶h thng: t╪g %d 甶觤"},
	[480]	= {nLevel_Low = 1, 	nLevel_High = 5, 	nTime = 60, szTips = "%s h� n閕 c玭g c s竧: t╪g %d 甶觤"},
	[481]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s h� n閕 c玭g b╪g s竧: t╪g %d 甶觤"},
	[482]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s h� n閕 c玭g h醓 s竧: t╪g %d 甶觤"},
	[483]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s h� n閕 c玭g l玦 s竧: t╪g %d 甶觤"},
	[485]	= {nLevel_Low = 1, 	nLevel_High = 5, 	nTime = 60, szTips = "%s ngo筰 c玭g c s竧: t╪g %d 甶觤"},
	[486]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s ngo筰 c玭g b╪g s竧: t╪g %d 甶觤"},
	[487]	= {nLevel_Low = 5, 	nLevel_High = 10,	nTime = 60, szTips = "%s s竧 thng h� ngo筰 c玭g: t╪g %d%%"},
	[488]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "Li猲 ti誴 %s sinh m謓h t gi韎 h筺 t╪g %d 甶觤"},
	[489]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "Li猲 ti誴 %s n閕 c玭g t gi韎 h筺 t╪g %d 甶觤"},
	[490]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "Li猲 ti誴 %s sinh m謓h t gi韎 h筺 t╪g: %d 甶觤 v� li猲 ti誴 %s n閕 c玭g t gi韎 h筺 t╪g: %d 甶觤"},
	[493]	= {nLevel_Low = 1, 	nLevel_High = 3, 	nTime = 60, szTips = "%s t鑓  di chuy觧: t╪g %d%%"},
	[495]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s t� l� ch� m筺g: t╪g %d%%"},
	[496]	= {nLevel_Low = 1, 	nLevel_High = 2, 	nTime = 60, szTips = "%s xu蕋 chi猽 v� c玭g: %d%%"},
	[498]	= {nLevel_Low = 10, nLevel_High = 30, 	nTime = 60,	szTips = "%s h� ngo筰 c玭g h醓 s竧: t╪g %d 甶觤"},
	[499]	= {nLevel_Low = 10, nLevel_High = 30, 	nTime = 60,	szTips = "%s h� ngo筰 c玭g l玦 s竧: t╪g %d 甶觤"},
};

function sjskill_addskill(nTaskId, nLevel_Low, nLevel_High, nTime, tbTips)
	if ((not nTaskId) or (not sjskill_tbSkill[nTaskId])) then
		return 1;
	end
	if not nLevel_Low then
		nLevel_Low = sjskill_tbSkill[nTaskId].nLevel_Low;
	end
	if not nLevel_High then
		nLevel_Low = sjskill_tbSkill[nTaskId].nLevel_High;
	end
	if not nTime then
		nLevel_Low = sjskill_tbSkill[nTaskId].nTime;
	end
	
	local nLevel	= random(nLevel_Low,nLevel_High);
	AddSkillState(nTaskId, nLevel, 0, floor(18 * nTime));
	
	local szTips	= sjskill_tbSkill[nTaskId].szTips;
	for i = 1, getn(tbTips) do
		if (type(tbTips[i]) == "number") then
			tbTips[i] = floor(tbTips[i] * nLevel);
		end
	end
	Msg2Player(format("Ngi nh薾 頲 <color=yellow>"..szTips.."<color>", unpack(tbTips)));
end

function add462()
	sjskill_addskill(462, 2, 10, 0.5, {"N鯽 gi﹜",500});
end

function add463()
	sjskill_addskill(463, 2, 10, 0.5, {"N鯽 gi﹜", 500});	-- N鯽 gi﹜是12帧?
end

function add464()
	sjskill_addskill(464, 1, 10, 30, {"30 gi﹜", 100});
end

function add465()
	sjskill_addskill(465, 1, 10, 30, {"30 gi﹜",100});
end

function add466()
	sjskill_addskill(466, 1, 4, 60, {"1 ph髏", 10});
end

function add467()
	sjskill_addskill(467, 1, 4, 60, {"1 ph髏", 10});
end

function add468()
	sjskill_addskill(468, 1, 4, 60, {"1 ph髏", 10});
end

function add469()
	sjskill_addskill(469, 1, 4, 60, {"1 ph髏", 10});
end

function add471()
	sjskill_addskill(471, 2, 10, 0.5, {"N鯽 gi﹜", 500, "N鯽 gi﹜", 500});
end

function add472()
	sjskill_addskill(472, 1, 10, 30, {"30 gi﹜", 100, "30 gi﹜", 100});
end

function add472_1()
	sjskill_addskill(472, 1, 10, 60, {"1 ph髏", 100, "1 ph髏", 100});
end

function add472_2()
	sjskill_addskill(472, 2, 10, 60, {"1 ph髏", 500, "1 ph髏", 500});
end

function add473()
	sjskill_addskill(473, 1, 7, 60, {"1 ph髏", 10});
end

function add474()
	sjskill_addskill(474, 1, 7, 60, {"1 ph髏", 10});
end

function add475()
	sjskill_addskill(475, 1, 7, 60, {"1 ph髏", 10});
end

function add476()
	sjskill_addskill(476, 1, 7, 60, {"1 ph髏", 10});
end

function add477()
	sjskill_addskill(477, 1, 7, 60, {"1 ph髏", 10});
end

function add478()
	sjskill_addskill(478, 1, 4, 60, {"1 ph髏", 10});
end

function add479()
	sjskill_addskill(479, 10, 20, 60, {"1 ph髏", 10});
end

function add480()
	sjskill_addskill(480, 1, 5, 60, {"1 ph髏", 10});
end

function add481()
	sjskill_addskill(481, 10, 20, 60, {"1 ph髏", 10});
end

function add482()
	sjskill_addskill(482, 10, 20, 60, {"1 ph髏", 10});
end

function add483()
	sjskill_addskill(483, 10, 20, 60, {"1 ph髏", 10});
end

function add485()
	sjskill_addskill(485, 1, 5, 60, {"1 ph髏", 10});
end

function add486()
	sjskill_addskill(486, 1, 4, 60, {"1 ph髏", 10});
end

function add487()
	sjskill_addskill(487, 5, 10, 60, {"1 ph髏", 10});
end

function add487_1()
	sjskill_addskill(487, 1, 5, 60, {"1 ph髏", 10});
end

function add488()
	sjskill_addskill(488, 10, 20, 60, {"1 ph髏", 100});
end

function add489()
	sjskill_addskill(489, 10, 20, 60, {"1 ph髏", 100});
end

function add490()
	sjskill_addskill(490, 10, 20, 30, {"30 gi﹜", 100, "30 gi﹜", 100});
end

function add490_1()
	sjskill_addskill(490, 10, 20, 60, {"1 ph髏", 100, "1 ph髏", 100});
end

function add493()
	sjskill_addskill(493, 1, 3, 60, {"1 ph髏", 10});
end

function add495()
	sjskill_addskill(495, 10, 20, 60, {"1 ph髏", 10});
end

function add496()
	sjskill_addskill(496, 1, 2, 60, {"1 ph髏", 10});
end

function add498()
	sjskill_addskill(498, 10, 30, 60, {"1 ph髏", 10});
end

function add499()
	sjskill_addskill(499, 10, 30, 60, {"1 ph髏", 10});
end