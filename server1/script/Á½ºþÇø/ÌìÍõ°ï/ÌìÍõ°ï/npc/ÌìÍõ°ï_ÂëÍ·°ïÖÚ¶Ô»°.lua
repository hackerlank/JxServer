--两湖区 tianwang帮 码头帮众对话

function main(sel)
	UTask_tw = GetTask(3);
	if (UTask_tw >= 60*256+20) and (GetFaction() == "tianwang") then
	Say("tianwang帮众：要出岛去哪里？", 3, "Ba L╪g huy謓/yes", "Thanh Loa o/yes1", "Kh玭g r阨 o /no")
	else
	Say("tianwang帮众：要出岛去哪里？", 2, "Ba L╪g huy謓/yes", "Kh玭g r阨 o /no")
	end
end;

function yes()
	if (GetFaction() == "tianwang") then						--如果玩家是tianwang帮弟子，坐船不收钱
		Say("tianwang帮众：兄弟，坐好了！", 2, "Л頲 r錳! /ok1","Kh玭g r阨 o /no")
	else
	Say("tianwang帮众：不是本帮兄弟，坐船可不是免费的。", 1, "Л頲. /ok2")
	end
end;

function yes1()
if (GetFaction() == "tianwang帮") then						--如果玩家是tianwang帮弟子，坐船不收钱
	Say("tianwang帮众：青螺岛可不好闯，你准备好了吗？", 1, "Chu萵 b� xong r錳 /ok3")
else	
	Say("tianwang帮众：不是本帮兄弟，坐船可不是免费的。", 1, "好吧/ok4")
end;
end;

function no()
end;

function ok1()
NewWorld(53, 1793, 3159)						--回巴陵县
SetFightState(1)							--转换为战斗状态
end;

function ok2()
if (GetCash() >= 100) then						--参考值
	Pay(100)
	NewWorld(53, 1793, 3159)					--回巴陵县
	SetFightState(1)						--转换为战斗状态
else
	Say("tianwang帮众：没钱还到处乱逛？你是初进江湖的吧？", 0)		
end;
end;

function ok3()
NewWorld(68, 1634, 3242)						--去青螺岛
SetFightState(1)							--转换为战斗状态
end;

function ok4()
if (GetCash() >= 500) then						--参考值
	Pay(500)
	NewWorld(68, 1634, 3242)					--去青螺岛
	SetFightState(1)						--转换为战斗状态
else
	Say("tianwang帮众：没钱还到处乱逛？", 0)		
end;
end;
