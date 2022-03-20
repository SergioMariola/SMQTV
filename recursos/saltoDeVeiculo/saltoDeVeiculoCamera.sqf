private _transporte = _this;
private _camPos = player getRelPos [10, 180];
private _transPos = _transporte getRelPos [27, 180];
_camPos set [2, 10];
_transPos set [2, 8];
player allowDamage false;

//Cria camera
private _cam = "camera" camCreate _camPos;
//Olha para o jogador
_cam camPrepareTarget player;
_cam camCommitPrepared 0;
waitUntil { camCommitted _cam };
//Configura transição para aeronave de transporte
_cam camPrepareTarget _transporte;
_cam camPreparePos _transPos;
//Entra na camera
_cam cameraEffect ["internal", "BACK"];
sleep 0.5;
//Inicia transição
_cam camCommitPrepared 7;
waitUntil { camCommitted _cam };
sleep 0.5;
//Finaliza
_cam cameraEffect ["terminate", "back"];
camDestroy _cam;
player allowDamage true;