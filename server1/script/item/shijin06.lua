--Create by GGH
--屈原什锦粽子

--什锦粽子=红枣2+栗子2+粽叶2+稻米2+猪肉2+牛肉2(增加1,000的经验,成功率50％)
--蜜饯什锦粽子＝什锦粽子+任意粽子原料1(增加5,000的经验,成功率50％)
--八宝什锦粽子＝蜜饯什锦粽子+任意粽子原料1(增加30,000点经验,成功率30％)
--百果什锦粽子＝八宝什锦粽子+任意粽子原料1(增加100,000点经验,成功率20％)
--水晶什锦粽子＝百果什锦粽子+任意粽子原料1(增加500,000点的经验,成功率10％)
--屈原什锦粽子＝水晶什锦粽子+任意粽子原料1(增加100,000,000点经验,成功率3％)
--获得条件：
--1、材料齐全
--2、1000两银子
--加工条件：非屈原什锦粽子以外的各种什锦粽子和任一粽子原料；1000两银子
--失败结果：获得什锦粽子（无论你加工前是什么什锦粽子），加工用粽子材料消失，不返还1000两银子。
--限制说明：活动结束时功效消失（即变质），每T筰线一小时只能吃一个，一个角色吃超过20,000,000点经验的各类什锦粽子之后就不能再吃任何什锦粽子。


function main(sel)
firsttime = GetTask(139)
num = GetTask(138)
msg={	     "B筺  ╪ r蕋 nhi襲 b竛h ch璶g, kh玭g th� ╪ th猰 頲 n鱝 ",
	     "Ъng c蕄 c馻 b筺  t╪g l猲 ",
	     "B筺 c秏 th蕐 r蕋 no, ph秈 i th猰 ch髏 n鱝 m韎 c� th� ╪ b竛h ch璶g! ",
		 "B筺  ╪ r蕋 nhi襲 b竛h ch璶g, y l� c竔 cu鑙 c飊g "
	    }



	if(num > 20000000)  then   --使用经验大于20,000,000，不能再吃
		Msg2Player(msg[1])
		return 1
	else
		if (GetGameTime() > firsttime + 60 * 60) then
			AddOwnExp(200000000)  --经验值增加200000000
			time=GetItemGenTime(sel)
		        name=GetName()
	    		WriteLog("Ngi ch琲"..name.."T筰"..time.."╪ h誸 m閠 c竔 b竛h ch璶g Khu蕋 Nguy猲")
			Msg2Player(msg[2])
			SetTask(138,num+200000000)
			SetTask(139, GetGameTime())  --记录当前T筰线时间
			if(GetTask(138)>20000000) then
				Msg2Player(msg[4])
			end
			return 0
		elseif  (firsttime == 0) then
			AddOwnExp(200000000)  --经验值增加200000000
			time=GetItemGenTime(sel)
		        name=GetName()
	    		WriteLog("Ngi ch琲"..name.."T筰"..time.."╪ h誸 m閠 c竔 b竛h ch璶g Khu蕋 Nguy猲")
			Msg2Player(msg[2])
			SetTask(138,num+200000000)
			SetTask(139, GetGameTime())  --记录当前T筰线时间
			if(GetTask(138)>20000000) then
				Msg2Player(msg[4])
			end
			return 0	
		else
			Msg2Player(msg[3])
			return 1
		end

	end
end