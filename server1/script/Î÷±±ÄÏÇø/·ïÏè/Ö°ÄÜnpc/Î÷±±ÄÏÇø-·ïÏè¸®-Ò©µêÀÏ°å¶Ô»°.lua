--西北南区 凤翔府 药店老板对话
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("Thu鑓 c馻 b鎛 ti謒 to祅 l� th� thng h筺g, c� b謓h tr� b謓h, kh玭g b謓h cng th﹏, c� mu鑞 mua m閠 輙 kh玭g? ",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(12) 		--弹出交易框
end;

if TEACHERSWITCH then
	tinsert(OPTIONS, "Gi髉 ta c蕋 dc t鰑/brew")
end
tinsert(OPTIONS, "Giao d辌h/yes")
tinsert(OPTIONS, "Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine")
tinsert(OPTIONS, "Kh玭g giao d辌h/Cancel")
