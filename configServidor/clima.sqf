scriptName "clima";

private _tempo = 300;
while {true} do {
	_tempo setFog [0, 0, 0];
	_tempo setRain 0;
	sleep (_tempo * 2);
};