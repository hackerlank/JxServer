--用给予界面实现，用五件武器，包含金、木、水、火、土五行各一件，可换取一个垃圾戒指
--designed by yangqi
--written by renbin

function weapon_ring()

	Say("G莕 nh蕋 tr猲 giang h� chi誧 nh蒼 k� thi誹 , ta c騨g nh﹏ c� h閕 甶 nhi襲 h鋍 d筺g th� ngh� , ch� c莕 ngi chu萵 b� m閠 b� ng� h祅h lam thu閏 t輓h ch v� kh� c飊g 10 v筺 lng b筩 , ta l� c� th� gi髉 ngi i ph秈 m閠 lam thu閏 t輓h ch chi誧 nh蒼 , h琻 n鱝 m鏸 l莕 c騨g c� hi謚 qu� nga . xin h醝 ngi ph秈 thay i sao ? ",3,"T鑤 , ta 產ng c莕 c� chi誧 nh蒼 y /exchange_weapon","Ta trc m� m閠 ch髏 甶 /weapon_help","T輓h / ch鋘 甶 , ta c� th藅 l� nhi襲 chi誧 nh蒼 y /no")

end

function exchange_weapon()

	GiveItemUI( "Ng� h祅h v� kh� i chi誧 nh蒼 ", "Ng礽 c莕 chu萵 b� n╩ m鉵 v� kh� , chia ra l祄 kim  m閏  nc  l鯽  th� h� , ch� c莕 c竔 n祔 <color=blue> ng� h祅h y  h誸 <color> , h琻 n鱝 u mang c� <color=blue> m祏 xanh da tr阨 thu閏 t輓h <color> , li襫 c� th� i l蕐 m閠 chi誧 nh蒼 . <color=blue> v� kh� ch c蕄 b薱 c飊g ch駈g lo筰 u kh玭g b� h筺 ch� , m鏸 l莕 c莕 t鑞 hao 10 v筺 lng b筩 , tr╩ ph莕 tr╩ t� l� th祅h c玭g . <color>", "weapon_ring_Confirm", "onCancel" );
	
end

function weapon_ring_Confirm( nCount )

	onSeries = {1,1,1,1,1}
	if ( nCount ~= 5 ) then						--are there 5 weapons
		Say("Xin/m阨 n鱝 c萵 th薾 ki觤 tra m閠 c竔 , ng礽 cho ta v� kh� kh玭g ph� h頿 y猽 c莡 nga ",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )		--get itemindex
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)	--get magic attrib
--			Msg2Player("nSeries = "..nSeries)
--			Msg2Player("magictype = "..magictype)
			if ( ItemGenre ~= 0 ) then
				Say("Xin/m阨 n鱝 c萵 th薾 ki觤 tra m閠 c竔 , ng礽 cho ta v� kh� kh玭g ph� h頿 y猽 c莡 nga ",0)
				return 0
			elseif ( DetailType ~= 0 and DetailType ~= 1) then					--is it weapon
				Say("Xin/m阨 n鱝 c萵 th薾 ki觤 tra m閠 c竔 , ng礽 cho ta v� kh� kh玭g ph� h頿 y猽 c莡 nga ",0)
				return 0
			elseif ( magictype == 0 ) then
				Say("Mu鑞 ta bu玭 b竛 nhi襲 n╩ , c竔 n祔 b筩h thu閏 t輓h v� kh� c騨g mu鑞 ngu d鑤 l蒼 v祇 vt qua ki觤 tra , kh玭g c� c鯽 ",0)
				return 0
			elseif ( nSeries < 0 and nSeries > 4 ) then			--exception
				Say("Trang b� c馻 ngi th藅 k� qu竔 a  tr� l筰 cho ngi t鑤 l緈 . ",0)
				return 0
			elseif ( onSeries[nSeries + 1] == 0 ) then				--五行属性是否齐全
				Say("Xin/m阨 n鱝 c萵 th薾 ki觤 tra m閠 c竔 , ng礽 cho ta v� kh� ch ng� h祅h kh玭g y  h誸 nga ",0)
				return 0
			else
				onSeries[nSeries + 1] = 0
			end
		end
			onPay = 100000
			if ( GetCash() < onPay ) then
				Say("Kh玭g c� ti襫 kh玭g th� 頲 , ngi nh鱪g th� n祔 r竎h n竧  ch琲 nh璶g i kh玭g 頲 chi誧 nh蒼 c馻 ta ",0)
				return 0
			end
			for i = 1, nCount do
		
				nItemIndex = GetGiveItemUnit( i )
				k = RemoveItemByIndex( nItemIndex )
				if ( k ~= 1 ) then
					Say("Chuy謓 g� x秠 ra , ngi l祄 sao c� th� g箃 ta y ? ",0)
					return 0
				end
			
			end
			Pay( onPay )
			local _nSeed = SetRandSeed(234)					--固定的戒指
			AddItem(0,3,0,1,0,0,1,0,0,0,0,0)     			--戒指
			SetRandSeed(_nSeed)
			Say("D�/�  v藅 c馻 ngi qu� th藅 kh玭g t� , ta nh薾 , chi誧 nh蒼 n祔 s� l� c馻 ngi ",0)
		
	end
	
end

function weapon_help()

	Say("Ng礽 c莕 chu萵 b� n╩ m鉵 v� kh� , chia ra l祄 kim  m閏  nc  l鯽  th� h� , ch� c莕 ng� h祅h n祔 y  h誸 , h琻 n鱝 u mang c� m祏 xanh da tr阨 thu閏 t輓h , li襫 c� th� i l蕐 m閠 chi誧 nh蒼 . v� kh� ch c蕄 b薱 c飊g ch駈g lo筰 u kh玭g b� h筺 ch� , m鏸 l莕 c莕 t鑞 hao 10 v筺 lng b筩 , tr╩ ph莕 tr╩ t� l� th祅h c玭g . ",1,"Nga , ta hi觰 , c竚 琻 /no")

end


function no()

end
