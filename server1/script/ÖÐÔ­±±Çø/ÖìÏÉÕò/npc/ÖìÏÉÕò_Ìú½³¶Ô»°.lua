--中原北区 朱仙镇 铁匠对话
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>C莕 m鉵 v� kh� n祇 c� n鉯 ra, kh玭g c� m鉵 n祇 ta kh玭g l祄 頲!"

function main(sel)
	tiejiang_village()
end;


function yes()
Sale(86);  			--弹出交易框
end;
