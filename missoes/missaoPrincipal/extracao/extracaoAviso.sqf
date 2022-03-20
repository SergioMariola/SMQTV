params ["_veiculoEscolha"];

playSound "Beep_Target";
hintSilent parseText format ["
<t color='#ff4d4d'>======================</t><br/>
<t color='#ff944d'>===========</t><br/>
<t color='#ffff99'>====</t><br/><br/>
<t>Não há jogadores pilotos de transporte.<br/>Um %1 controlado por IA foi despachado da base para buscar vocês.<br/><br/>
Este é um recurso opcional e pode ser ignorado.<br/>
Observe no mapa um marcador verde indicando a zona de extração.<br/><br/>
<t color='#ffff99'>====</t><br/>
<t color='#ff944d'>===========</t><br/>
<t color='#ff4d4d'>======================</t>",
[configFile >> "CfgVehicles" >> _veiculoEscolha] call BIS_fnc_displayName];