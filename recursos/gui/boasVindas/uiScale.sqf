private _res = getResolution select 5;
if (_res > 0.55) then {
    ["importante", "Para melhor visualização de todos os elementos visuais na tela, é recomendado o uso do<br/>Tamanho de Interface 'Pequeno' ou 'Muito Pequeno'<br/>nas opções de vídeo", 2] call SMQTV_fnc_cutText;
};