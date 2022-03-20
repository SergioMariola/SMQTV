//reparo ajoelhado = "ainvpknlmstpslaywrfldnon_medic" || idle ajoelhado = "amovpknlmstpsraswrfldnon"
//reparo deitado = "ainvppnemstpslaywrfldnon_medic" || idle deitado = "amovppnemstpsraswrfldnon"

switch (_this) do {
    case "ainvpknlmstpslaywrfldnon_medic" : {player switchMove "amovpknlmstpsraswrfldnon"};
    case "ainvppnemstpslaywrfldnon_medic" : {player switchMove "amovppnemstpsraswrfldnon"};
    default {};
};

private _texto = "O veículo se afastou de você<br/><t size='1.3'>O reparo foi cancelado</t>";
["importante", _texto, 0.5] call SMQTV_fnc_cutText;