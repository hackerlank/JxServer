--Creator:yfeng
--Date:2004-9-6
--Comm:客户端升级提示信息

STRTAB_LEVELUP={
	[2]="<> ch骳 m鮪g ngi l猲 t韎 2 c蕄  ngi c� th� n th玭 b猲 ngo礽 t譵 v� s� h鋍 t藀 khinh c玭g li評 . ",
	[5]="<> ch骳 m鮪g ngi l猲 t韎 5 c蕄  ngi  kh玭g h� n鱝 y誹 kh玭g kh醝 phong , c� th� 甶 i th祅h th� g苝 m閠 ch髏 i m苩 . ",
	[10]="<> ch骳 m鮪g ngi l猲 t韎 10 c蕄  ngi  c� nh蕋 nh c玭g  , c� th� v祇 ph竔 b竔 s� h鋍 ngh� li評 . tay m韎 trong th玭 c� c竎 i m玭 ph竔 ch m玭  , b鋘 h� s� d蒼 ngi v祇 ph竔 , s� m玭 s� c� nhi謒 v� ch� ngi . v祇 ph竔 sau li襫 c� th� � m玭 ph竔 b╪g t莕 trong t竛 g蓇 . ng th阨 , ngi c� th� c飊g ngi kh竎 pk li評 , c遪 c� th� � th祅h tr蕁 trong b祔 s筽 b竛  . ",
	[20]="<> ch骳 m鮪g ngi l猲 t韎 20 c蕄  ngi  s� li評 thi猲 l� truy襫 ﹎ , c� th� � th祅h ph� b╪g t莕 trong t竛 g蓇 . h琻 n鱝 , ngi c� th� c靑 m� li評 , c竎 i th祅h th� u c� m� phi課 t� . ngi  l� th祅h ngi li評 , c� th� k誸 h玭 , mang theo ngi m閠 n鯽 kia 甶 giang t﹏ th玭 ch nguy謙 l穙 n琲  th祅h th﹏ 甶 . ng th阨 kh玭g n猲 qu猲 tr� v� chuy課 s� m玭 , c� nhi謒 v� m韎 ch� ngi nga ",
	[30]="<> ch骳 m鮪g ngi l猲 t韎 30 c蕄  ngi thi猲 l� truy襫 ﹎ c秐h gi韎 cao h琻 , c� th� tr猲 i gi韎 b╪g t莕 trong t竛 g蓇 . ng th阨 kh玭g n猲 qu猲 tr� v� chuy課 s� m玭 , c� nhi謒 v� m韎 ch� ngi nga ",
	[40]="<> ch骳 m鮪g ngi l猲 t韎 40 c蕄  ngi c� th� tham gia t鑞g kim i chi課 , t鑞g kim chi課 trng � v祇 tng dng c飊g Chu ti猲 tr蕁 gi鱝 . ng th阨 kh玭g n猲 qu猲 tr� v� chuy課 s� m玭 , c� nhi謒 v� m韎 ch� ngi nga ",
	[50]="<> ch骳 m鮪g ngi l猲 t韎 50 c蕄  ngi c� th� 甶 t葃 t駓 o li評 , � n琲 n祇 ngi c� th� t緈 r琲 ti襪 n╪g 甶觤 c飊g k� n╪g 甶觤 , c竎 i th祅h th� ch phu xe c� th� d蒼 ngi 甶 . ng th阨 kh玭g n猲 qu猲 tr� v� chuy課 s� m玭 , c� 50 c蕄 nhi謒 v� c飊g xu蕋 s� nhi謒 v� ch� ngi nga ",
	[60]="<> ngi c� th� l祄 tr� v� s� nhi謒 v� , ho祅 th祅h nhi謒 v� sau c� th� h鋍 頲 tr蕁 ph竔 tuy謙 h鋍 ",
}

function main(lvl)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	if ( GetLevel() == 30 ) then
		if ( Uworld1001 == 60 ) and ( Uworld1002 == 60 ) and ( Uworld1003 == 108) then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 30 c蕄 ch ch輓h ph竔 , trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 60 ) and ( Uworld1002 == 60 )  then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 30 c蕄 ch ch輓h ph竔 , trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1001,80)
			nt_setTask(1003,109)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 30 c蕄 ch ch輓h ph竔 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 30 c蕄 ch trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 60 ) then
			nt_setTask(1001,80)
			SendTaskOrder("Ng礽 thu 頲 30 c蕄 ch ch輓h ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 60 ) then
			nt_setTask(1002,80)
			SendTaskOrder("Ng礽 thu 頲 30 c蕄 ch trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1003 == 108) then
			nt_setTask(1003,109)
			SendTaskOrder("Ng礽 thu 頲 30 c蕄 ch t� ph竔 tr薾 doanh nhi謒 v� . ")
		end
	elseif ( GetLevel() == 40 ) then
		if ( Uworld1001 == 130 ) and ( Uworld1002 == 110 ) and ( Uworld1003 == 208 ) then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 40 c蕄 ch ch輓h ph竔 , trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 130 ) and ( Uworld1002 == 110 )  then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 40 c蕄 ch ch輓h ph竔 , trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 130 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1001,150)
			nt_setTask(1003,209)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 40 c蕄 ch ch輓h ph竔 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 110 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 40 c蕄 ch trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 130 ) then
			nt_setTask(1001,150)
			SendTaskOrder("Ng礽 thu 頲 40 c蕄 ch ch輓h ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 110 ) then
			nt_setTask(1002,130)
			SendTaskOrder("Ng礽 thu 頲 40 c蕄 ch trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1003 == 208 ) then
			nt_setTask(1003,209)
			SendTaskOrder("Ng礽 thu 頲 40 c蕄 ch t� ph竔 tr薾 doanh nhi謒 v� . ")
		end
	elseif ( GetLevel() == 50 ) then
		if ( Uworld1001 == 200 ) and ( Uworld1002 == 180 ) and ( Uworld1003 == 328) then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch ch輓h ph竔 , trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 200 ) and ( Uworld1002 == 180 )  then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch ch輓h ph竔 , trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 200 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1001,220)
			nt_setTask(1003,329)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch ch輓h ph竔 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 180 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 200 ) then
			nt_setTask(1001,220)
			SendTaskOrder("Ng礽 thu 頲 50 c蕄 ch ch輓h ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 180 ) then
			nt_setTask(1002,200)
			SendTaskOrder("Ng礽 thu 頲 50 c蕄 ch trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1003 == 328 ) then
			nt_setTask(1003,329)
			SendTaskOrder("Ng礽 thu 頲 50 c蕄 ch t� ph竔 tr薾 doanh nhi謒 v� . ")
		end
	elseif ( GetLevel() == 60 ) then
		if ( Uworld1001 == 270 ) and ( Uworld1002 == 240 ) and ( Uworld1003 == 408 ) then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch ch輓h ph竔 , trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 270 ) and ( Uworld1002 == 240 )  then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch ch輓h ph竔 , trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 270 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1001,290)
			nt_setTask(1003,409)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch ch輓h ph竔 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 240 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("Ng礽 ng th阨 thu 頲 50 c蕄 ch trung l藀 , t� ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1001 == 270 ) then
			nt_setTask(1001,290)
			SendTaskOrder("Ng礽 thu 頲 50 c蕄 ch ch輓h ph竔 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1002 == 240 ) then
			nt_setTask(1002,260)
			SendTaskOrder("Ng礽 thu 頲 50 c蕄 ch trung l藀 tr薾 doanh nhi謒 v� . ")
		elseif ( Uworld1003 == 408 ) then
			nt_setTask(1003,409)
			SendTaskOrder("Ng礽 thu 頲 50 c蕄 ch t� ph竔 tr薾 doanh nhi謒 v� . ")
		end
	else
		return Msg2Player(STRTAB_LEVELUP[lvl])
	end
end
