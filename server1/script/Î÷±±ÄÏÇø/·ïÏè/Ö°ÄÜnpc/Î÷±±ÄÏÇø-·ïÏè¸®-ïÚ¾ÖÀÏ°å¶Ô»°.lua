--西北南区 凤翔府 镖局老板对话
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(188) == 1 then
		allbrother_0801_FindNpcTaskDialog(188)
		return 0;
	end
	
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_shuangying()
	else
		i = random(0,1)
		if (i == 0) then
Say("Song g ti猽 c鬰 ch髇g ta � T﹜ B綾, b筺 b� t鑤 x蕌 u c�. V� v藋 c玭g vi謈 b秓 Ti猽 kh玭g th蕋 tho竧, c騨g nh� v祇 s� n� m苩 c馻 b筺 b� tr猲 giang h� ",0)
		else
Say("Ch髇g ta l� nh鱪g ngi b秓 Ti猽, ngo礽 kh� n╪g c遪 ph秈 d鵤 v祇 hai ch� 'giao t譶h' v韎 b籲g h鱱 tr猲 giang h�. C� l骳 c遪 hi謚 qu� h琻 r蕋 nhi襲", 0)
		end;
	end
end
		
		