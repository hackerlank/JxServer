--两湖区 巴陵县 长江码头船夫对话
--suyu
--200306015
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

CurWharf = 5;
Include("\\Script\\Global\\station.lua");
---------------------------------------------------------------
function main(sel)

if (GetLevel() >= 5) then		--等级达到5级
	Say("Ta c� bi謙 hi謚 l� 'L穘g L� B筩h 襲', ba i 甶襲 s鑞g d鵤 v祇 s玭g nc! Kh緋 Ba L╪g Huy謓 n祔 kh玭g c� ai l� i th�! Kh竎h quan mu鑞 甶 u? ", 2, "Ng錳 Thuy襫/WharfFun", "Kh玭g ng錳/OnCancel");
else		
	Say("Чt Level 10 r錳 h穣 n g苝 ta.", 0)
end

end;

---------------------------------------------------------------
function  OnCancel()
   Say("Kh玭g ti襫 kh玭g th� ng錳 thuy襫.",0)
end;

------------------------------------------------