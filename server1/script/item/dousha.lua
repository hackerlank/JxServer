function main()
	local eattime = GetTask(1502)
	local eatexp = GetTask(1501)
	local eatmsg = {"<#>�����̫������ӣ��Ѿ����ܼ������ˣ�",
		"<#>����úܱ���Ҫ��һ��ʱ��ſ��Գ����ӣ�",
		"<#>������㹻������ӣ����Ѿ������һ����"
		}
	local randomexp = {10000, 20000, 50000}
	if(eatexp > 20000000)  then   --ʹ�þ������20,000,000�������ٳ�
		Msg2Player(eatmsg[1])
		return 1
	else
		if (GetGameTime() > eattime + 60 * 60) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501, eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --��¼��ǰ����ʱ��
			if(GetTask(1501) > 20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0
		elseif  (eattime == 0) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501,eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --��¼��ǰ����ʱ��
			if(GetTask(1501) >20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0	
		else
			Msg2Player(eatmsg[2])
			return 1
		end

	end
end