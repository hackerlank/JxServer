--两湖区 巴陵县 路人7方可为对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(200) == 1 then
		allbrother_0801_FindNpcTaskDialog(200)
		return 0;
	end

i = random(0,2)

if (i == 0) then
Say("Ba L╪g huy謓 c馻 ch髇g ta l� m閠 v飊g t nh�. Nh璶g cu閏 s鑞g m鋓 ngi kh� an b譶h.",0)
return
end;

if (i == 1) then
Say("稵hi猲 Vng Bang ch輓h l� c鴘 c竛h c馻 ch髇g ta. N誹 kh玭g c� h� th� thi猲 h祅h o th� ch髇g ta h糿  b� b鋘 tham quan nh騨g nhi評 r鎖.",0)
return
end;

if (i == 2) then
Say("Trong m総 c馻 b� t竛h. Thi猲 Vng Bang 甶襲 l� nh鱪g v� anh h飊g h秓 h竛. Thi誹 ni猲 trong v飊g 甶襲 mu鑞 gia nh藀 Thi猲 Vng Bang.",0)
end;

end;

