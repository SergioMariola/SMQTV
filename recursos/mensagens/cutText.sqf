params ["_modo", "_texto"];
private _tempo = param [2, -1, [0]];

switch (_modo) do
{
	case "importante":
	{
		_modo cutText ["<t size='2' font='PuristaBold'>" + _texto + "</t>", "PLAIN", _tempo, true, true];
	};

	case "naoImportante":
	{
		_modo cutText ["<t size='2' font='PuristaBold'>" + _texto + "</t>", "PLAIN DOWN", _tempo, true, true];
	};
};