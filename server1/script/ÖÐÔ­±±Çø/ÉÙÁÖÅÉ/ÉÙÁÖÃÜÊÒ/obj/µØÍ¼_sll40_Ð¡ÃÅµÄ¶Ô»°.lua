--少林后山密室 内室 小窗前的对话
-- by：Dan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl >= 40*256+20) and (UTask_sl < 50*256) then		-- 必须在任务中才能进入，并且每次进入都要回答问题
		Say("B莕 t╪g 產ng b� quan tu luy謓, n誹 c� mu鑞 truy襫 l阨 cho b鋘 h� th� th玭g qua hai c﹗ kh萿 quy誸 n祔! Nghe k� y!",4,"竛 Ma Ni B竧 M� H錸g /L40_S2_wrong","H錸g B鑙 M� Ma Ni 竛 /L40_S2_wrong","B竧 M� Ni H錸g 竛 Ma /L40_S2_wrong","竛 B竧 Ni Ma M� H錸g. /L40_S2_correct")
	elseif (UTask_sl == 40*256+50) then
		Talk(3,"","Kh萿 quy誸 quan tr鋘g th� n祔 sao ngi c� th� qu猲 頲? Ta n鉯 l筰 m閠 l莕 h穣 nh� k� !","C﹗ th� nh蕋 l�: Th� gian v� thng, Qu鑓 Th� Nguy Qu�, c﹗ th� hai l�: T� Чi Kh� Kh玭g, Ng� Dng V� Ng�, c﹗ th� 3 l�: Sanh Di謙 Bi課 Th╪g, H� Ng魕 V� Ch�, c﹗ th� 4 l�: T﹎ Th� 竎 Nguy猲, H譶h Vi T閕 T萿, c﹗ th� 5 l�: Nh� Th� Quan S竧, Ti猰 Ly Sinh T�.","L莕 n祔 ng qu猲 n鱝 !  甶!")
	else
		Msg2Player("Th莕 t╪g 產ng b� quan t藀 luy謓 n琲 y, xin ng l祄 phi襫 ")
	end
end;

function L40_S2_correct()
	Talk(9,"L50_step2","е t� c莡 ki課 S� th骳 t�!","C� chuy謓 g�?","Chng m玭 ph竔  t� n th豱h m阨 hai v� S� th骳 t� xu蕋 quan, b祅 c竎h c鬰 th� thi猲 h�.","Kh玭g T辌h: Thi猲 h� hai ch� hai ngi ch髇g ta kh玭g hi觰, ngi chuy觧 gi髉 5 c﹗ n祔 cho chng m玭, 玭g ta s� hi觰 r�.","C﹗ th� nh蕋: Th� Gian V� Thng, Qu鑓 Th� Nguy Qu�,","Kh玭g T辌h: C﹗ th� hai: T� Чi Kh� Kh玭g, Ng� Dng V� Ng�,","C﹗ th� ba: Sinh Di謙 Bi課 Th╪g, H� Ng魕 V� Ch�,","Kh玭g T辌h: C﹗ th� t� l�: T﹎ Th� 竎 Nguy猲, H譶h Vi T閕 T萿,")
end;

function L40_S2_wrong()
	Talk(1,"","Sau khi c xong kh萿 quy誸 c秐h c鯽 nh� kh玭g lung lay ch髏 n祇, c� ph秈 b筺  ni謒 sai kh玭g?")
end;

function L50_step2()
	Talk(1,"","Th� t� c馻 n╩ c﹗ kh萿 quy誸 n祔 ph秈 nh� r� !  甶!")
	SetTask(7,40*256+50)
	AddNote("G苝 T辌h Di謙 Nh� T╪g c莡 truy襫 t l筰 ch� th� cho phng Trng. ")
	Msg2Player("G苝 T辌h Di謙 Nh� T╪g c莡 truy襫 t l筰 ch� th� cho phng Trng. ")
end;
