--Create by mengfan ,2004-9-14
--贡月芙蓉
--作用：中秋高级月饼之一，作用同洗髓经，80级以上Ngi ch琲使用，增加5点潜能点。
--获得条件：集齐获得此物品所需要的所有单字。
--限制说明：该物品要求人物等级80级时使用有效，每人最多使用3次。
--任务变量701低4位表示使用该物品的次数



function main(sel)
	times = GetTask(701)
        str ={
		"<#> B筺 c緉 th� m閠 mi課g C鑞g Nguy謙 Ph� Dung, k誸 qu� kh玭g c� chuy謓 g� x秠 ra.: (",
		"<#> B筺 c緉 m閠 mi課g C鑞g Nguy謙 Ph� Dung, c秏 th蕐 c� th� kh醗 h糿, kinh m筩h l璾 th玭g.",
		"<#> B筺  ╪ 3 c竔 C鑞g Nguy謙 Ph� Dung, kh玭g th� d飊g ti誴."
	        }
	level = GetLevel()
	if(level < 80) then     --等级太低，不让使用
		Msg2Player(str[1])
		return 1
	end
	if(times > 2) then      --使用超过次数
		Msg2Player(str[3])
		return 1
	end
	AddProp(5)              --潜能点增加5点
	time=date("%m%d%H%M%S")
        name=GetName()
	WriteLog("Ngi ch琲"..name.."T筰"..time.." h誸 m閠 c竔 B竛h Trung thu C鑞g Nguy謙 Ph� Dung")
	SetTask(701,times+1)
	Msg2Player(str[2])
	return 0
end	