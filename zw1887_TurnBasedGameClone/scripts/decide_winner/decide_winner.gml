// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function decide_winner(v0, v1){
	with (obj_game_manager) {
		if (v0 != v1) {
			if (v0 == global.ROCK) {
				if (v1 == global.SCISSOR) {
					score0 += 1;
					audio_play_sound(snd_win, 10, 0);	
				} else {
					score1 += 1;
					audio_play_sound(snd_lose, 10, 0);	
				}
			} else if (v0 == global.PAPER) {
				if (v1 == global.ROCK) {
					score0 += 1;
					audio_play_sound(snd_win, 10, 0);	
				} else {
					score1 += 1;
					audio_play_sound(snd_lose, 10, 0);	
				}
			} else if (v0 == global.SCISSOR) {
				if (v1 == global.PAPER) {
					score0 += 1;
					audio_play_sound(snd_win, 10, 0);	
				} else  {
					score1 += 1;
					audio_play_sound(snd_lose, 10, 0);		
				}
			}
		} else {
			audio_play_sound(snd_flip, 10, 0);
		}
	}
}