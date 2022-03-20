//curando ajoelhado = "ainvpknlmstpslaywrfldnon_medicother" || idle ajoelhado = "amovpknlmstpsraswrfldnon"
//curando deitado = "ainvppnemstpslaywrfldnon_medicother" || idle deitado = "amovppnemstpsraswrfldnon"

private _anim = animationState player;
switch (_anim) do {
    case "ainvpknlmstpslaywrfldnon_medicother" : {player switchMove "amovpknlmstpsraswrfldnon"};
    case "ainvppnemstpslaywrfldnon_medicother" : {player switchMove "amovppnemstpsraswrfldnon"};
    default {};
};

private _texto = ([name _this, " se afastou de você<br/><t size='1.3'>A cura foi cancelada</t>"] joinString "");
["importante", _texto, 0.5] call SMQTV_fnc_cutText;