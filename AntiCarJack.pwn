

new TimerState[MAX_PLAYERS][2];
forward CheckTimerState(playerid, timerid);

public CheckTimerState(playerid, timerid){
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) Slap(playerid);
	KillTimer(TimerState[playerid][timerid]);
	TimerState[playerid][timerid] = -1;
    return 1;
}

stock cocheocupado(vehicleid)
{
    for(new i; i<GetMaxPlayers(); i++)
        if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
            return 1;
    return 0;
}

stock Slap(playerid){
	new Float:Xs, Float:Ys, Float:Zs;
	GetPlayerPos(playerid, Xs, Ys, Zs);
	SetPlayerPos(playerid, Xs, Ys, Zs+2.8);
	return 1;
}

public ac_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger && cocheocupado(vehicleid)){
		if(TimerState[playerid][0] != -1 && TimerState[playerid][1] != -1){
		    TimerState[playerid][0] = SetTimerEx("CheckTimerState", 50, false, "ii", playerid, 0);
		    TimerState[playerid][1] = SetTimerEx("CheckTimerState", GetPlayerPing(playerid), false, "ii", playerid, 1);
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) Slap(playerid);
		}
	}
	return 1;
}
