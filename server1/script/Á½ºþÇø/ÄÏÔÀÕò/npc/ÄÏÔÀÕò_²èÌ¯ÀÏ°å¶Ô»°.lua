--两湖区 南岳镇 茶摊老板对话

function main(sel)
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","Ngi n d� la tin t鴆 c竔 ch誸 c馻 Th� Lang 礹? H礽, g莕 y di ch﹏ n骾 Ho祅h S琻 c� nhi襲 ngi ch誸 l緈. V� b� kho竔 H鴄 Nh� Gia hay n qu竛 ta ╪ u鑞g c騨g ch誸 m閠 c竎h k� l�, quan ph� n gi� ch璦 t譵 ra th� ph筸 n鱝, l祄 ngi ta s� qu�, kh玭g bi誸 c� manh m鑙 m韎 ch璦? ta c騨g kh玭g r� n鱝, ngi 甶 h醝 th� ngi kh竎 xem sao.")
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n鉯 c� m閠 v� s� th竔 kh玭g bi誸 t� mi誹 n祇 n, ph竝 l鵦 v� bi猲 ngi 甶 h醝 th� xem sao.")
		return
	end;
		 
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Kh竎h quan! Х n Ho祅h s琻 nh蕋 nh ph秈 th� tr� V﹏ V� � ch� ch髇g ta y. ")
	elseif (i == 1) then
		Talk(1,""," 'Danh s琻 danh th駓 xu蕋 danh tr�', tr� V﹏ V� l� c s秐 c馻 Ho祅h s琻 ch髇g ta t� l﹗  th祅h danh, s韒  頲 li謙 v祇 danh s竎h c鑞g ph萴 i Л阯g. ")
	else
		Talk(1,"","M飅 v� tr� V﹏ V� r蕋 n錸g, hng kh� ng祇 ng箃, tinh khi誸 m� kh玭g nh箃, n錸g m� kh玭g ch竧, pha l猲 1 蕀 tr�, kh玭g ch� c� th� 頲 gi秈 kh竧 m� c遪 c� th� gi秈 c")
	end
end
