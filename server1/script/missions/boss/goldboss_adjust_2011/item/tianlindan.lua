-- �ļ�������tianlindan.lua
-- �����ߡ���wangjingjun
-- ���ݡ��������鵤��ÿ�����ֻ��ʹ��2��
-- ����ʱ�䣺2011-09-01 09:42:31

Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

TSK_USED = 2800	-- �����������
--1 ����ʹ��5�����鵤- Modified by DinhHQ - 20111013
NDAILYTIME = 5


function main()
	
	local tbAward = {
		{nExp_tl=1,nCount = 20000000,},
		}
	local szFailMsg = format("ÿ��ÿ��ֻ��ʹ����� %d ��, ���������ʹ��",NDAILYTIME)	
	if PlayerFunLib:CheckTaskDaily(TSK_USED, NDAILYTIME, szFailMsg, "<") == 1 then
		PlayerFunLib:AddTaskDaily(TSK_USED, 1) 
		tbAwardTemplet:Give(tbAward, 1, {"goldbossadjust_2011", "use_tianlindan"} )
		return 0
	end
	
	return 1
end