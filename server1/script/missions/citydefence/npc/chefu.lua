----------------------------------------------------------------
--FileName:	chefu.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ������㳵�򣬿���ȥ��7�����
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
function main()
	Say("����:ս�����࣬�ϰ�������ʮ�����࣡��֪����ʱ�ŵ�ͷ��������ȥ������?", 8, tbDEFENCE_RETURN[1][3].."/#cd_transtocity(1)", tbDEFENCE_RETURN[11][3].."/#cd_transtocity(11)", tbDEFENCE_RETURN[37][3].."/#cd_transtocity(37)", tbDEFENCE_RETURN[78][3].."/#cd_transtocity(78)", tbDEFENCE_RETURN[80][3].."/#cd_transtocity(80)", tbDEFENCE_RETURN[162][3].."/#cd_transtocity(162)", tbDEFENCE_RETURN[176][3].."/#cd_transtocity(176)", "Kh�ng c�n/OnCancel" )
end

function OnCancel()
end

function cd_transtocity(cityid)
	Msg2Player("�����ˣ�׼������!"..tbDEFENCE_RETURN[cityid][3])
	NewWorld( cityid, tbDEFENCE_RETURN[cityid][1], tbDEFENCE_RETURN[cityid][2] )
end