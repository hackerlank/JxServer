--description: 汴京府铁塔二层宝箱 天忍教50级任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	UTask_trsub01 = GetTask(21)
	if (UTask_tr == 50*256+20) and (HaveItem(161) == 1) then
		DelItem(161)
		if (GetBit(UTask_trsub01,2) == 0) then
			UTask_trsub01 = SetBit(UTask_trsub01,2,1)
			SetTask(21, UTask_trsub01)
			AddNote("M� 頲 c� quan th� hai ")
			Msg2Player("M� 頲 B秓 rng � t莕g th� hai. M� 頲 c� quan th� hai ")
			if (UTask_trsub01 == 7) then 			-- bin: 100 + 010 + 001
				Talk(1,"","B筺  ph� 頲 c� quan t莕g 3, c鴘 頲 Ph鬾g H蕄 Nh�.")
				Msg2Player("B筺  ph� 頲 c� quan t莕g 3, c鴘 頲 Ph鬾g H蕄 Nh�.")
				SetTask(4, 50*256+50)
				AddNote("C� ba c� quan u  m�, c鴘 頲 Ph鬾g H蕄 Nh� ")
			end
		else
			Talk(1,"","C� quan  m� ra")
		end
	elseif (UTask_tr == 50*256+20) and (GetBit(UTask_trsub01,2) == 1) then
		Talk(1,"","C� quan  m� ra")
	elseif (UTask_tr == 50*256+50)  then
		Talk(1,"","C� quan  m� ra")
	else
		Talk(1,"","Kh玭g c� ch譨 kh鉧 th� kh玭g th� m� 頲 c� quan n祔 ")
	end
end;
