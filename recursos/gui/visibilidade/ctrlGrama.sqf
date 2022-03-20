params ["_control", "_selectedIndex"];
private _grid = 0;

switch (_selectedIndex) do {
	case 0: {
		setTerrainGrid 25;
		_grid = 25;
	};
	case 1: {
		setTerrainGrid 12.5;
		_grid = 12.5;
	};
	case 2: {
		setTerrainGrid 3.125;
		_grid = 3.125;
	};
	default { };
};

profileNamespace setVariable ["SMQTV_terrainGrid", _grid];