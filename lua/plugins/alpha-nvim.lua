return {
	"goolord/alpha-nvim",
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'
	},
	config = function()
		local alpha = require("alpha")
		-- local dashboard = require("alpha.themes.dashboard")
		local theta = require("alpha.themes.theta")
		theta.header.val = {
			"           -mh.                           h.    `Ndho               ",
			"           hmh+                          oNm.   oNdhh               ",
			"          `Nmhd`                        /NNmd  /NNhhd               ",
			"          -NNhhy                      `hMNmmm`+NNdhhh               ",
			"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
			"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
			"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
			"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
			" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
			" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
			" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
			" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
			"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
			"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
			"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
			"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
			"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
			"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
			"       //+++//++++++////+++///::--                 .::::-------::   ",
			"       :/++++///////////++++//////.                -:/:----::../-   ",
			"       -/++++//++///+//////////////               .::::---:::-.+`   ",
			"       `////////////////////////////:.            --::-----...-/    ",
			"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
			"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
			"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
			"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
			"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
			"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
			"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
			"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
			"                        .-:mNdhh:.......--::::-`                    ",
			"                           yNh/..------..`                          ",
		}
		-- theta.header.val = {
		-- 	"_____                            _____   _____   _   _    _____   _        ______ ",
		-- 	"|_   _|                          / ____| |_   _| | \\ | |  / ____| | |      |  ____|",
		-- 	"| |       __ _   _ __ ___     | (___     | |   |  \\| | | |  __  | |      | |__   ",
		-- 	"| |      / _` | | '_ ` _ \\     \\___ \\    | |   | . ` | | | |_ | | |      |  __|  ",
		-- 	"_| |_    | (_| | | | | | | |    ____) |  _| |_  | |\\  | | |__| | | |____  | |____ ",
		-- 	"|_____|    \\__,_| |_| |_| |_|   |_____/  |_____| |_| \\_|  \\_____| |______| |______|",
		--
		-- }
		-- alpha.setup(require("alpha.themes.theta").config)
		theta.config.opts.margin = 0
		theta.header.opts.position = "center"
		alpha.setup(theta.config)
	end,

}
