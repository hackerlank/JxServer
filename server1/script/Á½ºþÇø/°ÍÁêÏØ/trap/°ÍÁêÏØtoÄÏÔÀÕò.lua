--两湖区 巴陵县to南岳镇
--TrapID：两湖区 80
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)
if (GetLevel() >= 5) then						--等级达到十级
	SetFightState(1);
	NewWorld(54, 1471 ,2992)
else
	Talk(1,"","Ph輆 trc nguy hi觤! Xin h穣 quay v� r蘮 luy謓 th猰!")
	SetPos(1808, 3456)						--走出Trap点
end

	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
end;
