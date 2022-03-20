params ["_modo", "_marcador", "_marcadores"];

switch (_modo) do {
	case "criarMP":
	{
		private _pos = getMarkerPos _marcador;
		_marcador = createMarkerLocal ["missaoPrincipal", _pos];
		_marcador setMarkerTypeLocal "Empty";
		_marcador setMarkerShapeLocal "ELLIPSE";
		_marcador setMarkerSizeLocal areaTamanho;
		_marcador setMarkerColor "ColorRed";
		_marcador
	};
	case "excluirMP":
	{
		private _marcadorX = createMarkerLocal ["Finalizado" + _marcador, getMarkerPos _marcador];
		_marcadorX setMarkerTypeLocal "flag_NATO";
		_marcadorX setMarkerText "Missão concluída";
		private _index = _marcadores findIf {_x isEqualTo _marcador};
		_marcadores deleteAt _index;
		deleteMarker "missaoPrincipal";
	};
	case "criarUnica":
	{
		private _pos = param [3];
		private _tipo = param [4];
		_marcador = createMarkerLocal ["marcador" + str _pos, _pos];
		_marcador setMarkerType _tipo;
		_marcador
	};
	default {};
};