-------------------------------------------------------------------------
-- FileName		:	enemy_wulinrenwulanzhan.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_����������ս
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1054 = nt_getTask(1054)
Uworld1012 = nt_getTask(1012)
	if ( Uworld1054 == 130 ) and ( Uworld1012 >= 30 ) then
		nt_setTask(1012,0)
		SetMemberTask(1054,130,140,zhengbranch2) 
	elseif ( Uworld1054 == 130 ) then
		Uworld1012 = Uworld1012 + 10
		nt_setTask(1012,Uworld1012)
		Talk(1,"","����������㣬����Ҳ����������.")
	end
end

function zhengbranch2()
	AddOwnExp(30000)
	AddExp_Skill_Extend(30000)
	Msg2Player("���Ѿ��õ����������Ի�������������.")
	Talk(1,"","�������⣬���ð�.")
end