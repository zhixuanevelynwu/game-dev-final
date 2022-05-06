/// @description Insert description here
// You can write your code in this editor

global.state_deal = 0;
global.state_reshuffle = 1;
global.state_input = 2;
global.state_compare = 3;
global.state_rebuild = 4;
global.state_takeback = 5;
global.state = global.state_reshuffle;

global.player_hand_y = room_height - room_height / 4.5;
global.ai_hand_y = room_height / 4;

global.deck = ds_list_create();
global.hand0 = ds_list_create(); 
global.hand1 = ds_list_create(); 
global.discard_pile = ds_list_create();

global.ai_turn = false;
global.selected_card = noone;

global.ROCK = 1;
global.PAPER = 2;
global.SCISSOR = 3;

global.num_rounds = 3;
global.round = 1;

taken_back = false;
selected_card0 = noone;
selected_card1 = noone;
player_selected_card = noone;
ai_selected_card0 = noone;
ai_selected_card1 = noone;
ai_selected_card = noone;

deck_x = room_width / 3.5;
deck_y = room_height / 2;
discard_pile_x = room_width / 10 * 7;
discard_pile_y = room_height / 2;
discard_current_y = discard_pile_y;
offset = 5;

num_cards = 24;
max_hand = 3;
num_hand0 = 0;
num_hand1 = 0;

global.score0 = 0;
global.score1 = 0;

wait_timer = 0;
spacing = 20;
card_width = sprite_get_width(spr_card);

snd_deal_played = false;
temp_list = ds_list_create();

create_deck(num_cards);
