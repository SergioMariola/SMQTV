private _pos = _this;
private _camPos = _pos vectorAdd [0, 0, 100];

//Cria camera
private _cam = "camera" camCreate _camPos;

//Configura alvo
_cam camPrepareTarget player;

//Realiza ação
_cam camCommitPrepared 0;
waitUntil { camCommitted _cam };

//Entra na camera
_cam cameraEffect ["internal", "BACK"];

//Configura alvo
_cam camPrepareRelPos [0, -2, -40];

//Realiza ação
_cam camCommitPrepared 3;
waitUntil { camCommitted _cam };

//Termina
_cam cameraEffect ["terminate", "back"];
camDestroy _cam;