//Для этого понадобится ColAndreas (Я использовал 1.4.0)


public OnPlayerUpdate(playerid){
 	//Anti Gay-Fly//
 	if(GetPlayerVehicleID(i) == 0){
        	switch(GetPlayerAnimationIndex(i)){ //Проверка анимации плавания
	        	case 1543, 1539, 1250:{ // Макс.скорость когда плывёшь (25км/ч) - внизу сток, можете заменить на свой, но надо замерить скорость
				//p.s Добавить систему варнов бы ( из OnPlayerUpdate воткнуть в 1 секундный таймер, иначе эта хуйня неконтроллируема )
	 		    if(!IsPlayerInWater(i) && GetPlayerSpeed(i) >= 25) Kick(i); //Здесь твоя функция - кика
            		}
		}
	}
	return 1;
}


//Проверка, находится ли игрок в воде
stock IsPlayerInWater(playerid)
{
	new Float:x, Float:y, Float:z, Float:retx[2], Float:rety[2], Float:retz[2], Float: retdist[2], modelids[2];
	GetPlayerPos(playerid, x, y, z);
	new collisions = CA_RayCastMultiLine(x, y, z+0.7, x, y, z-0.7, retx, rety, retz, retdist, modelids, 2);
	if(collisions){
		for(new i = 0; i < collisions; i++){
			if (modelids[i] == WATER_OBJECT){
			    return (true);
			}
		}
	}
	return (false);
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
