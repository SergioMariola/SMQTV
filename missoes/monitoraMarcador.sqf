params ["_modo", "_objeto", "_marcador"];

waitUntil {alive _objeto};

switch (_modo) do {
	case "estatico":
	{
		waitUntil { sleep 5; !alive _objeto };
	};
	case "seguir":
	{
		while {sleep 2; alive _objeto} do {
			_marcador setMarkerPos _objeto;
		};
	};
	default {};
};

deleteMarker _marcador;