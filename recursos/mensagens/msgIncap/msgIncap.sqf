params ["_jog", "_modo"];

_txt = "";
switch (_modo) do {
  case "incap": { _txt = " foi incapacitado" };
  case "morto": { _txt = " foi morto" };
  default {};
};

systemChat ([name _jog, _txt] joinString "");

if (local _jog) exitWith {};

while {lifeState _jog isEqualTo "INCAPACITATED"} do {
  _jog say3D [selectRandom (SMQTV_sons select 4), 300, 1, true];
  sleep (selectRandom [15, 17, 20]);
};