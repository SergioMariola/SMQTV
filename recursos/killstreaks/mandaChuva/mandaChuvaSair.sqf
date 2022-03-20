params ["_caller", "_gunner", "_veiculo", "_grupo", "_viewDistance", "_objectViewDistance", "_nomeJogador"];

SMQTV_mandaChuvaPos = nil;
SMQTV_areaSelecionada = nil;
_caller setVariable ["SMQTV_mandaChuvaEmUso", nil];

//Aplica de volta as configurações visuais originais do jogador
setViewDistance _viewDistance;
setObjectViewDistance _objectViewDistance;

//Exclui aeronave e tripulantes
_gunner switchCamera "INTERNAL";
sleep 0.1;
objNull remoteControl _gunner;
sleep 0.1;
player switchCamera "INTERNAL";

private _texto = format ["== Manda Chuva (%1) off-line ==", _nomeJogador];
_texto remoteExec ["systemChat"];
["Manda Chuva off-line", nil, 3] spawn SMQTV_fnc_barraAviso;

sleep 1;

{
	deleteVehicle _x;
	sleep 0.2;
} forEach ([_veiculo] + (units _grupo));