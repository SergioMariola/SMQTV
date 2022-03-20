call SMQTV_fnc_habilitaComunicacao;
sleep 0.1;
player sideRadio (selectRandom (SMQTV_radio select 5));
sleep 5;
call SMQTV_fnc_desabilitaComunicacao;