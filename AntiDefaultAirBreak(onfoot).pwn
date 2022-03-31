forward onesec();
new AirWarns[MAX_PLAYERS];
new OldSpeed[MAX_PLAYERS];
//В OnPlayerConnect 
//> AirWarns[playerid] = 0;
//> OldSpeed[playerid] = 0;
SetTimer("onesec", 1000, true);//В OnGameModeInIt

public onesec(){
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			//Добавьте сюда свою проверку на то, что игрок авторизован
			//Anti AirBreak (onfoot) //
			if(GetPlayerVehicleID(i) == 0){
				switch(GetPlayerAnimationIndex(i)){
					case 1231, 1266, 1257:{
					    if(GetPlayerSpeed(i) >= 80) Kick(i); //Функция кика (Anti SpeedHack Onfoot)
					}
	 		    	}
	 		    	switch(GetPlayerAnimationIndex(i)){
	 		        	case 1130, 1132:{
						if(OldSpeed[i] == GetPlayerSpeed(i)){
						    if(OldSpeed[i] != 0){
						        AirWarns[i]++;
					        	if(AirWarns[i] >= 4) Kick(i);//Функция кика
						    }
						}
					    	if(GetPlayerSpeed(i) == 21 || GetPlayerSpeed(i) == 57){
					        	AirWarns[i]++;
					        	if(AirWarns[i] >= 4) Kick(i);//Функция кика
						}
						OldSpeed[i] = GetPlayerSpeed(i);
					}
					default: AirWarns[i] = 0;
	 		    	}
			}
		}
	}
	return 1;
}

stock GetPlayerSpeed(playerid) 
{
	new Float:ST[4];
    	if(IsPlayerInAnyVehicle(playerid)){
		GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
	}
	else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
	ST[3] = floatsqroot(floatmul(ST[0], ST[0]) + floatmul(ST[1], ST[1]) + floatmul(ST[2], ST[2])) * 200;
    	return floatround(ST[3]);
}
