return {
	"EggbertFluffle/beepboop.nvim",
	enabled = false,
	opts = {
		audio_player = "mpv",
		max_sounds = 20,
		sound_map = {
			--{ auto_command = "VimEnter",      sound = "sound.ogg" },
			--{ auto_command = "InsertCharPre", sounds = { "sound.ogg" } }
		},
		{
			key_map = { mode = "n", key_chord = "j" },
			-- sounds = { 'cherrymx-black-pbt/sound.ogg' }
			sound = { 'sound.ogg' },
			sounds = { 'sound.ogg' }
		}
	}
}
