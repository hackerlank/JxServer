-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 16:28:14
-- Desc			:	送信任务车夫脚本
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua") --包含玩家死亡脚本
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器


--车夫处设置任务变量1201，1202，1203中的一个为20
function messenger_wagoner()
--	Uworld1201 = nt_getTask(1201)
--	Uworld1202 = nt_getTask(1202)
	Uworld1203 = nt_getTask(1203)
	Uworld1204 = nt_getTask(1204)
--	
--	if ( messenger_gettime() == 10 ) then
--		Msg2Player("对不住啊，你接的信使任务已经过期了，咱没办法送您咯。")
--		return
--	end
--	
--	if ( Uworld1201 ~= 0 ) then
--		if ( Uworld1201 == 10 ) then
--			Say("进入地图吗？",2,"是的/messenger_flywagoner","不了/no")
--		elseif ( Uworld1201 == 30 ) then
--			for i=1,getn(citygo) do 
--				if ( Uworld1204 == citygo[i][2]) then
--					Msg2Player("对不起，你还有信使任务已经完成但是没有提交，请先去"..citygo[i][4].."驿站交任务。")
--				end
--			end
--		end
--	elseif ( Uworld1202 ~= 0 ) then
--		if ( Uworld1202 == 10 ) then
--			Say("进入地图吗？",2,"是的/messenger_templewagoner","不了/no")
--		elseif ( Uworld1202 == 30 ) then
--			for i=1,getn(citygo) do   --表格应该有所不同？？
--				if ( Uworld1204 == citygo[i][2]) then   --？？
--					Msg2Player("对不起，你还有信使任务已经完成但是没有提交，请先去"..citygo[i][4].."驿站交任务。") --？？
--				end
--			end
--		end
	if ( Uworld1203 ~= 0 ) then
		if ( Uworld1203 == 10 or Uworld1203 == 20 or Uworld1203 == 21 ) then
			Say("C� mu鑞 v祇 khu v鵦 kh玭g?",2,"Mu鑞/messenger_storewagoner","Kh玭g mu鑞/no")
		elseif ( Uworld1203 == 30 ) then
			for i=1,getn(citygo) do   --表格应该有所不同？？
				if ( Uworld1204 == citygo[i][2]) then   --？？
					Msg2Player("Xin l鏸! Nhi謒 v� T輓 S� c馻 b筺  ho祅 th祅h nh璶g ch璦 giao tr�, m阨 b筺 甶 giao tr� nhi謒 v�."..citygo[i][4].."Giao nhi謒 v� � D辌h tr筸") --？？
				end
			end
		end
	else
		Msg2Player("Xin lng th�, ngi v蒼 ch璦 nh薾 頲 nhi謒 v� Лa Tin, h穣 t譵 D辌h Quan nh薾 nhi謒 v� trc ")
	end
end

--function messenger_flywagoner()
--	SetRevPos(80,40)
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(387,1582,3137)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(388,1582,3137)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(389,1582,3137)
--	end
--end
--
--function messenger_templewagoner()
--	SetRevPos(176,70)
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(390,1312,3198)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(391,1312,3198)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(392,1312,3198)
--	end
--end

function messenger_storewagoner()
	SetRevPos(11,10)
	
	NewWorld(395,1417,3207)
	
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(393,1417,3207)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(394,1417,3207)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(395,1417,3207)
--	end

end