-- 算命先生.lua 看声望值的算命先生
-- By Dan_Deng(2003-11-11)

sexhead = {"Nam","N� "}

Include("\\script\\global\\repute_head.lua")

function main()
	if (GetSex() == 0) then			-- 男女用不同的对话
		Say("V� thi誹 hi謕 n祔 kh� ph竎h b蕋 ph祄!  C� mu鑞 bi誸 tng lai s竛g l筺 c馻 m譶h kh玭g? Ch� c莕 5000 lng! ",2,"Л頲,  ta xem th�/view_repute_yes","Kh玭g c莕 u/no")
	else
		Say("V� n� hi謕 n祔 kh� ph竎h b蕋 ph祄!  C� mu鑞 bi誸 tng lai s竛g l筺 c馻 m譶h kh玭g? Ch� c莕 5000 lng!",2,"Л頲,  ta xem th�/view_repute_yes","Kh玭g c莕 u/no")
	end
end

function view_repute_yes()
	if (GetCash() < 500) then
		Talk(1,"","L筰 m閠 ngi kh玭g c� ti襫 n鱝, l祄 ph� m蕋 n鯽 ng祔 tr阨")		
		return 0
	end
	Pay(500)
	repute_exp = GetRepute()
	repute_lvl = GetReputeLevel(repute_exp)
	if (repute_lvl == -1) then			-- 出错时
		Talk(1,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽")
	elseif (repute_lvl == 0) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.." Giang h� coi ngi l� <color=red>M韎 t竔 xu蕋 giang h�<color>.")
	elseif (repute_lvl == 1) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>S� nh藀 giang h�<color>.")
	elseif (repute_lvl == 2) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>V� Danh ti觰 b鑙<color>.")
	elseif (repute_lvl == 3) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>M芻 M芻 v� v╪<color>.")
	elseif (repute_lvl == 4) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>S� Hi觧 phong mang<color>.")
	elseif (repute_lvl == 5) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>Ti觰 H鰑 danh kh�<color>.")
	elseif (repute_lvl == 6) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>Danh u hng lng<color>.")
	elseif (repute_lvl == 7) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>Uy Tr蕁 nh蕋 phng<color>.")
	elseif (repute_lvl == 8) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>Ng筼 Th� qu莕 h飊g<color>.")
	elseif (repute_lvl == 9) then
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>Nh蕋 Чi t玭g s�<color>.")
	else
		Talk(2,"","Th莕 long gi� l祄 ngi tr莕 gian.M芻 d� hi謓 gi� ngi 產ng long 畂ng, nh璶g s� ph竧 tri觧 r蕋 nhanh. Ngi tinh � s� ph竧 hi謓 ra ngi l� m閠 thi猲 t礽","Danh v鋘g giang h� c馻 ngi hi謓 t筰 l�"..repute_exp.."Giang h� coi ngi l�<color=red>Ti誹 Ng筼 giang h�<color>.")
	end
end

function no()
end
