//Обычная проверка пола под ногами игрока
//Помогает при телепортации на маппинг, который не у всех моментально загружается
//Использую ColAndreas 1.4.1
//Добавьте сверху загрузочный экран и наслаждайтесь

//При телепорте:
ac_TogglePlayerControllable(playerid, 0);
SetTimerEx("CheckLoading", 1000, false, "i", playerid);

forward CheckLoading(playerid);
public CheckLoading(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(CA_RayCastLine(X, Y, Z, X, Y, Z-2.0, X, Y, Z) > 0)
	{
		ac_TogglePlayerControllable(playerid, 1);
	}else SetTimerEx("CheckLoading", 1000, false, "i", playerid);
	return 1;
}
