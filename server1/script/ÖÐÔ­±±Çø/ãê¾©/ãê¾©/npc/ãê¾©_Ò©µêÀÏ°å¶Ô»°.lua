--中原北区 汴京府 药店老板对话
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("Ti謒 ta thu鑓 n祇 c騨g c�, dng th﹏ ki謓 th�, k衞 d礽 tu鎖 th�, b� m竨 輈h kh�, ngi mu鑞 mua g�?",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(9) 			--弹出交易框
end

if TEACHERSWITCH then
	tinsert(OPTIONS, "Gi髉 ta c蕋 dc t鰑/brew")
end
tinsert(OPTIONS, "Giao d辌h/yes")
tinsert(OPTIONS, "Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine")
tinsert(OPTIONS, "Kh玭g giao d辌h/Cancel")
