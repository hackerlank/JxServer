--description: 新手村_行脚商人
--author: wangzg	
--date: 2003/7/21
--update 2003/7/28 yuanlan


function main()
	UTask_world38=GetTask(66)
	if (UTask_world38 == 2) then
		Say("Mu鑞 mua x� hng kh玭g? Ta c� thu鑓 danh ti課g ch輓h t玭g y, ch� c莕 200 lng th玦! ", 2 ,"Mua/yes","Kh玭g mua/no")
	else	
		Talk(1,"","L祄 H祅h cc Thng nh﹏ t� nam ra b綾 th藅 kh玭g d�, xem nh鱪g h祅g ho� trong tay ta y, kh� c� th� ki誱 頲 h祅g t鑤 h琻!")
	end
end;

function yes()
	if (GetCash()<200) then
		Talk(1,"","ьi ngi c� ti襫 r錳 h穣 n t譵 ta!")
	else
		Pay(200)
		AddEventItem(142)
		Msg2Player("T� ch� H祅h t萿 thng nh﹏ mua 頲 X� Hng. ")
		AddNote("T� ch� H祅h t萿 thng nh﹏ mua 頲 X� Hng. ")
	end
end

function no()
end
