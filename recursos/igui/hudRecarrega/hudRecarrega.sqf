params ["_displayOrControl", ["_config", configNull]];

sleep 0.1;
_estado = 1;

while { _estado > 0 } do {
    _displayOrControl progressSetPosition (1 - _estado);
    _estado = weaponState player select 6;
    sleep 0.005;
};

"SMQTV_hudRecarrega" cutFadeOut -1;