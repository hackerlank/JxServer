Include("\\script\\missions\\freshman_match\\match\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV( MS_TIME_1 ) + 1
	SetMissionV( MS_TIME_1, timer_1 )
	if ( timer_1 == UP_A_TIME ) then
		Msg2MSAll( MISSIONID, "<color=yellow>Th�i gian chu�n b� thi ��u m�n ph�i ki�t xu�t �� k�t th�c, thi ��u ch�nh th�c b�t ��u." );
print("match start!!!!**************************************************************start")
		SetMissionV( MS_STATE, 2 );
		RunMission( MISSIONID )
	elseif ( ( timer_1 > UP_A_TIME ) and ( mod( timer_1, 2 ) == 0 ) ) then
		gametime = ( floor( GetMSRestTime( MISSIONID, TIMERID_TOTAL_INNER ) / 18 ) );
		RestMin = floor( gametime / 60 );
		RestSec = mod( gametime,60 );
		if ( RestMin == 0 ) then
			Msg2MSAll( MISSIONID, "<#> Giai �o�n chi�n ��u: Th�i gian thi ��u ki�t xu�t m�n ph�i c�n l�i"..RestSec.."<#> gi�y." );
		elseif (RestSec == 0) then
			Msg2MSAll( MISSIONID, "<#> Giai �o�n chi�n ��u: Th�i gian thi ��u ki�t xu�t m�n ph�i c�n l�i"..RestMin.."<#> ph�t." );
		end;
	end
end
