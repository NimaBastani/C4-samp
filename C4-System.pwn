// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <foreach>
#include <zcmd>
#include <ColAndreas>

#define COLOR_ERROR 0xC1F589FF
new Bombing[MAX_PLAYERS];
new Text:Bomb_TD;
public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	CA_Init();

	Bomb_TD = TextDrawCreate(320.00000, 240.00000, "LD_BEAT:triang");
	TextDrawLetterSize(Bomb_TD, 0.000000, 0.000000);
	TextDrawTextSize(Bomb_TD, 15.000000, 15.000000);
	TextDrawAlignment(Bomb_TD, 1);
	TextDrawColor(Bomb_TD, -1);
	TextDrawSetShadow(Bomb_TD, 0);
	TextDrawSetOutline(Bomb_TD, 0);
	TextDrawBackgroundColor(Bomb_TD, 255);
	TextDrawFont(Bomb_TD, 4);
	TextDrawSetProportional(Bomb_TD, 0);
	TextDrawSetShadow(Bomb_TD, 0);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}


public OnPlayerConnect(playerid)
{
    Bombing[playerid] = 0;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		foreach(Player,i)
		{
			if(GetPlayerInterior(playerid) == GetPlayerInterior(i) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				{
					SendClientMessage(i, col1, string);
				}
				else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				{
					SendClientMessage(i, col2, string);
				}
				else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				{
					SendClientMessage(i, col3, string);
				}
				else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				{
					SendClientMessage(i, col4, string);
				}
				else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendClientMessage(i, col5, string);
				}
			}
		}
	}
	return 1;
}

stock SetObjectFaceCoords3D(iObject, Float: fX, Float: fY, Float: fZ, Float: fRollOffset = 0.0, Float: fPitchOffset = 0.0, Float: fYawOffset = 0.0) {
    new
        Float: fOX,
        Float: fOY,
        Float: fOZ,
        Float: fPitch
    ;
    GetObjectPos(iObject, fOX, fOY, fOZ);

    fPitch = floatsqroot(floatpower(fX - fOX, 2.0) + floatpower(fY - fOY, 2.0));
    fPitch = floatabs(atan2(fPitch, fZ - fOZ));

    fZ = atan2(fY - fOY, fX - fOX) - 90.0; // Yaw

    SetObjectRot(iObject, fRollOffset, fPitch + fPitchOffset, fZ + fYawOffset);
}


CMD:c4(playerid, params[])
{
	TextDrawShowForPlayer(playerid, Bomb_TD);
    Bombing[playerid] = 1;
    return 1;
}
forward BeterekoonBomb(playerid, Float:X, Float:Y, Float:Z, ObjId);
public BeterekoonBomb(playerid, Float:X, Float:Y, Float:Z, ObjId)
{
        new string[512];
        new sendername[25];
        GetPlayerName(playerid, sendername, sizeof(sendername));
        format(string, sizeof(string), "* %s's Bomb has been exploded ", sendername);
        ProxDetector(12.0, playerid, string, -1,-1,-1,-1,-1);
        DestroyObject(ObjId);
        CreateExplosion(X, Y, Z, 2, 18.0);
        return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_FIRE && Bombing[playerid] == 1)
	{
	    new
	        Float:fPX, Float:fPY, Float:fPZ,
	        Float:fVX, Float:fVY, Float:fVZ,
	        Float:object_x, Float:object_y, Float:object_z;

	    // Change me to change the scale you want. A larger scale increases the distance from the camera.
	    // A negative scale will inverse the vectors and make them face in the opposite direction.
	    const
	        Float:fScale = 5.0;

	    GetPlayerCameraPos(playerid, fPX, fPY, fPZ);
	    GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);

	    object_x = fPX + floatmul(fVX, fScale);
	    object_y = fPY + floatmul(fVY, fScale);
	    object_z = fPZ + floatmul(fVZ, fScale);

	    new Float:pX,Float:pY,Float:pZ;
	    GetPlayerPos(playerid, pX, pY, pZ);

	    new Float:RayX, Float:RayY, Float:RayZ;
	//  new CA_BP;
	    new CA_BP = CA_RayCastLine(pX, pY, pZ, object_x, object_y, object_z, RayX, RayY, RayZ);
	    if(!CA_BP) return SendClientMessage(playerid, COLOR_ERROR, "Error: That way is too far.");
	//    PlayerInfo[playerid][pBombs] -= 1;
	    new c4obj;
	    c4obj = CreateObject(1654, RayX, RayY, RayZ,   0.00000, 0.00000, 0);
	    SetObjectFaceCoords3D(c4obj, pX, pY, pZ, 0.0, 180.0, 90.0);
    	TextDrawHideForPlayer(playerid, Bomb_TD);


	    new sendername[25];
	    GetPlayerName(playerid, sendername, sizeof(sendername));

	    new string[512];
	    format(string, sizeof(string), "* %s's Bomb has been planted[10secound] ", sendername);
	    ProxDetector(12.0, playerid, string, -1,-1,-1,-1,-1);

	    SetTimerEx("BeterekoonBomb", 10000, 0, "dfffd", playerid, RayX, RayY, RayZ, c4obj);
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
