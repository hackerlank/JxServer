--西南北区 成都府 衙门门口告示牌1
-- Update: Dan_Deng(2004-02-27) 重新设计任务(成都杀野猪)
-- 可重复任务（重复周期：现实时间1天）

function main(sel)
	Uworld11 = GetTask(11)
	Udate = tonumber(date("%Y%m%d"))						-- 需要转换成数值才能直接进行比较
	if (GetSex() == 0) then			-- 男女内容不同
		sexstr = "Tr竛g s� "
	else
		sexstr = "N� hi謕"
	end

	if (Uworld11 == 0) or ((Uworld11 > 255) and (Uworld11 < Udate)) then		-- 可以接任务
		Say("Th玭g c竜: G莕 y c竎 v飊g ngo筰 � b� heo r鮪g qu蕐 nhi評, ph� ho筰 m颽 m祅g, th藅 l� phi襫 ph鴆,  treo gi秈 500 l筺g b筩  t譵 d騨g s� di謙 b莥 heo r鮪g n祔. H� gi誸 頲 b鋘 ch髇g th� n nha m玭 l穘h thng.",2,"B秐g ni猰 y誸 /W11_get","Kh玭g m祅g /no")
	elseif (Uworld11 <= 255) then		-- 任务进行中
		Talk(1,"","Nha d辌h ph� Th祅h Й: "..sexstr..GetName().."许多侠士乐意为民除害，给人民带来平安，准备迎接战胜归来的Tr竛g s� . ")
	else				-- 未到重复时间
		Talk(1,"","Nha d辌h ph� Th祅h Й: "..sexstr..GetName().."V� d﹏ tr� h鋋, ai di謙 頲 m鑙 ho� heo r鮪g � 4 v飊g, b鎛 ph� thng ngay 500 l筺g v� bi觰 dng h祅h ng ngh躠 hi謕. B� c竜. ")
	end
end;

function W11_get()
	Talk(1,"","B筺 gi藅 l蕐 b秐 th玭g c竜, quy誸 t﹎ tr� h筰 gi髉 b� t竛h!")
	SetTask(11,1)
end

function no()
end
