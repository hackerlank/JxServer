-------------------------------------------------------------------------
-- FileName		:	enemy_biaozhiboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 17:30:14
-- Desc			:   ��֮��ؿ��ı�־boss�ű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ������
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_gogogo()
	
	
	local _, _, nMapIndex = GetPos()
------------------------------------------------------��������------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1201)  --��֮��������������
	local Uworld1204 = nt_getTask(1204)  --�������������ص��������
	local Uworld1205 = nt_getTask(1205)  --��ʹ����
	local Uworld1206 = nt_getTask(1206)  --��ʹ�ƺ�
	local Uworld1207 = nt_getTask(1207)  --��ʹ����ǰɱ�ּ�����
	local Uworld1208 = nt_getTask(1208)  --��֮��ɱ�ּ�����
	local Uworld1211 = nt_getTask(1211)  --��ʹ����ؿ���ʼʱ��
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1214 = nt_getTask(1214)  --�����ֿ���
	local Uworld1215 = nt_getTask(1215)  --bossˢ�ֿ���
	local messenger_nowtime = GetGameTime()  --�����ҵ�ǰ����ʱ��
	local Uworld1212  =  messenger_nowtime - Uworld1211 --�����ҵ�ǰ�ڸùؿ���ͼ����ʱ��
	local Npcindex = GetLastDiagNpc()
	SetTaskTemp(180,Npcindex)    --����ǰBoss�����浽һ����ʱ������
	
	
------------------------------------------------------�����ж�--------------------------------------------
	
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --�����������Ͷ��Ѿ���������
		--Msg2Player("�㻹������û����ɣ����͡�") ����������
	else
		local messenger_choice = random(1,40)
		--if ( messenger_choice == 4 ) then  --����һ�����ش���
		--	local lucky_hongbao = random(1,10)
		--	if ( lucky_hongbao == 5 ) then
		--		AddItem(6,1,402,0,0,0)      
		--		Msg2Player("������һ�����ش���")
		--	end
		if ( messenger_choice == 7) then  --���û�еõ���������������ӻ���20����
			if ( Uworld1213 == 0 ) then
				nt_setTask(1213,messenger_nowtime)
				Msg2Player("��20����ɱ��ʱ������˫������ֵ����!")
				AddSkillState( 548, 1, 1, 21600)
			else
				Msg2Player("���ѽӴ������")
			end
		elseif ( messenger_choice == 11 ) then  --���ӻ���10 
			nt_setTask(1205,Uworld1205+20)
			tongaward_message(20);	--by Сɽ
			Msg2Player("�i�����ʹ�����������20��!")
		elseif ( messenger_choice == 13 ) then  --���ٻ���10
			if ( Uworld1205 >= 10 ) then 
				nt_setTask(1205,Uworld1205-10)
				Msg2Player("�����ʹ������ּ���10��!")
			end
		elseif ( messenger_choice == 16 ) then  --���û�д����������ֵ��¼���������ĳ������������¼�,
			local lucky_dingdian = random(1,3)  --�ٴο��Ƽ���Ϊ1/3
			
			if ( Uworld1214 == 0 ) then
				if ( lucky_dingdian == 2 ) then  
					Uworld1214 = random(1,15)                                   
					nt_setTask(1214,Uworld1214)									--��¼��killfly����ȡ�õ�����
					if ( SubWorldIdx2ID( nMapIndex ) == 387 ) then
						Msg2Player("�ڵ������µı��ʱ�����ҵ�һ���š����и�����ȥ"..killfly[Uworld1214][1]..","..killfly[Uworld1214][2].."�õؽ��� "..killfly[Uworld1214][3].."��Ʒ����������ʲô����?")
					elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) then
						Msg2Player("�ڵ������µı��ʱ�����ҵ�һ���š����и�����ȥ"..killfly2[Uworld1214][1]..","..killfly2[Uworld1214][2].."�õؽ���"..killfly2[Uworld1214][3].."��Ʒ����������ʲô����?")
					elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) then
						Msg2Player("�ڵ������µı��ʱ�����ҵ�һ���š����и�����ȥ"..killfly3[Uworld1214][1]..","..killfly3[Uworld1214][2].."�õؽ���"..killfly3[Uworld1214][3].."��Ʒ����������ʲô����?")
					end
				end
			else
				Msg2Player("���ѽӴ�����")
			end
			
		elseif ( messenger_choice == 19 ) then 	--�ڸ�boss��������if ( messenger_npcindex == killflyboss[i][10]) ��npc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
	
				if ( SubWorldIdx2ID( nMapIndex ) == 387 ) and ( GetGlbValue(811) < 30 ) then --���ƻ�����ˢ������Ϊ10��30֧
					SetGlbValue(811,GetGlbValue(811)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
					Msg2Player("��ɽ���ҵģ��˴����ҵģ�˭��������ͷ������!��ɱ����һ���ܻ�ó������ϵĽ���) ")
					for i=1,getn(killflyboss) do  								  --ȥ����boss���������ɵ�npc������Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == killflyboss[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(killflyboss[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss[i][4] * 32
								TabValue5 = killflyboss[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss[i][1],killflyboss[i][2],Tid,TabValue4,TabValue5,killflyboss[i][6],killflyboss[i][7],killflyboss[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss[i][10]);
							end
						end
					end
					
				elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) and ( GetGlbValue(812) < 30 ) then
					SetGlbValue(812,GetGlbValue(812)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
					Msg2Player("��ɽ���ҵģ��˴����ҵģ�˭��������ͷ������!��ɱ����һ���ܻ�ó������ϵĽ���!) ")
	
					for i=1,getn(killflyboss2) do  								  --ȥ����boss���������ɵ�npc������Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == killflyboss2[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(killflyboss2[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss2[i][4] * 32
								TabValue5 = killflyboss2[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss2[i][1],killflyboss2[i][2],Tid,TabValue4,TabValue5,killflyboss2[i][6],killflyboss2[i][7],killflyboss2[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss2[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss2[i][10]);
							end
						end
					end
					
				elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) and ( GetGlbValue(813) < 30 ) then
					SetGlbValue(813,GetGlbValue(813)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
					Msg2Player("��ɽ���ҵģ��˴����ҵģ�˭��������ͷ������!��ɱ����һ���ܻ�ó������ϵĽ���!) ")
	
					for i=1,getn(killflyboss3) do  								  --ȥ����boss���������ɵ�npc������Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == killflyboss3[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(killflyboss3[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss3[i][4] * 32
								TabValue5 = killflyboss3[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss3[i][1],killflyboss3[i][2],Tid,TabValue4,TabValue5,killflyboss3[i][6],killflyboss3[i][7],killflyboss3[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss3[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss3[i][10]);
							end
						end
					end
				end
			end
		end
	end
		
--------------------------------------------------��boss�����Ļ�������-------------------------------------------------------
	if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("˫������ֵʱ���ѽ���!")
		else
			AddOwnExp(FLYBOSS_EXP)    --����һ���ľ���
		end
	end
	
	local Uworld1205 = nt_getTask(1205)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1208)
	
	messenger_killnpc_jifen(FLYBOSS_MESSENGEREXP,FLYBOSS_MAPID)
	SetMessengerPlayer(1207,1208,FLYBOSS_EXP,FLYBOSS_MAPID)   --���ӷ�֮��ɱ���������ӵ�ǰ�ؿ�ɱ���������Ӿ���
	
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 3);
	HideNpc(GetTaskTemp(180),FLYBOSS_RELIVE*18)  --18��Ϊһ��  ���ظöԻ��͵�npc
	Talk(1,"","���ѵ��������")
end