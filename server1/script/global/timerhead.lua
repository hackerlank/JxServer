-- TimerHead.lua
-- By: Dan_Deng(2003-08-23) 计时器相关工具

FramePerSec = 18			-- 每 gi﹜ 帧数当作常量处理
CTime = 600					-- 每 c� canh gi� 按600 gi﹜ （10分钟）计算

function GetRestSec(i)		-- 直接返回计时器剩余 gi﹜ 数
	return floor(GetRestTime(i) / FramePerSec)
end;

function GetRestCTime(i)			-- 获取计时器剩余时间，大于一 c� canh gi� 时按中国时间转换
	x = floor(GetRestTime(i) / FramePerSec)
	if (x < CTime) then		-- 不足一 c� canh gi� 
		y = x.." gi﹜ "
	else
		y = floor(x / CTime).." c� canh gi� "
	end
	return y
end;

function GetTimerTask(i)			-- 通过计时器ID号解析相应任务
	
end