//Для этого понадобится ColAndreas (Я использовал 1.4.0)


public OnPlayerUpdate(playerid){
 	//Anti Gay-Fly
 	if(GetPlayerVehicleID(i) == 0){
        switch(GetPlayerAnimationIndex(i)){ //Проверка анимации плавания
	        case 1543, 1539, 1250:{
	 		    if(!IsPlayerInWater(i)) Kick(i); //Здесь твоя функция - кика
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
