-- Created by firefox
-- 如意卡
-- 可以自己编辑祝福
IL("SETTING")
IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=1016
STSK_OTHERNAME = 3
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
function main(nIndex)
	if (gb_GetModule("Thi謕 th玭g b竜 ch骳 m鮪g m祏") == 1) then
		Say("Зy l� 1 Nh� � Thi誴. Trc ti猲 h穣 nh藀 i tng c莕 ch骳 ph骳 r錳 sau  m韎 nh藀 n閕 dung c莕 ch骳.", 
			2, 
			"B総 u ch骳 ph骳/want2bless",
			"L竧 n鱝 m韎 g雐/OnCancel")
	end
	return 1
end

function want2bless(nIndex)
		AskClientForString("PlayerSelect", "", 1, 16, "Xin nh藀 t猲 i phng");
end

function PlayerSelect(rolename)
	if (ST_CheckTextFilter(rolename) ~= 1) then
		Say("Xin l鏸! T猲 b筺 nh藀 v祇 c� ch� kh玭g h頿 l�, h穣 th� l筰 l莕 n鱝!", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(rolename, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin l鏸! T猲 b筺 nh藀 v祇 c� ch� kh玭g h頿 l�, h穣 th� l筰 l莕 n鱝!", 0)
			return
		end
	end
	SetStringTask(STSK_OTHERNAME,rolename)
	AskClientForString("BlessPlayer", "", 1, 100, "Xin nh藀 l阨 ch骳 ph骳 v祇");
end

function BlessPlayer(szBless)
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("Xin l鏸! T猲 b筺 nh藀 v祇 c� ch� kh玭g h頿 l�, h穣 th� l筰 l莕 n鱝!", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin l鏸! T猲 b筺 nh藀 v祇 c� ch� kh玭g h頿 l�, h穣 th� l筰 l莕 n鱝!", 0)
			return
		end
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg
		szMsg = GetName().."<#> n鉯 v韎 "..GetStringTask(STSK_OTHERNAME).."<#> "..szBless
		AddGlobalCountNews(szMsg,3);
	else
		Msg2Player("Kh玭g t譵 頲 th�! Xin th� l筰 1 l莕!.")
	end
end

