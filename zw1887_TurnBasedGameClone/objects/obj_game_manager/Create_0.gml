/// @description Insert description here
// You can write your code in this editor

global.state_deal = 0;
global.state_reshuffle = 1;
global.state_input = 2;
global.state_compare = 3;
global.state_rebuild = 4;
global.state_takeback = 5;
global.state = global.state_reshuffle;

global.player_hand_y = room_height - room_height / 5;
global.ai_hand_y = room_height / 5;

global.deck = ds_list_create();
global.hand0 = ds_list_create(); 
global.hand1 = ds_list_create(); 
global.discard_pile = ds_list_create();

global.ai_turn = false;
global.selected_card = noone;

taken_back = false;
selected_card0 = noone;
selected_card1 = noone;
player_selected_card = noone;
ai_selected_card0 = noone;
ai_selected_card1 = noone;
ai_selected_card = noone;

deck_x = room_width / 10;
deck_y = room_height / 2;
discard_pile_x = room_width / 10 * 9;
discard_pile_y = room_height / 2;
discard_current_y = discard_pile_y;
offset = 3;

num_cards = 24;
max_hand = 3;
num_hand0 = 0;
num_hand1 = 0;

score0 = 0;
score1 = 0;

wait_timer = 0;
frame = 0;
spacing = 20;
card_width = sprite_get_width(spr_card);

ROCK = 1;
PAPER = 2;
SCISSOR = 3;

snd_deal_played = false;

card_types = ds_list_create();
temp_list = ds_list_create();
for (i = 0; i < num_cards; i++) {
	img_index = 0;
	if (i < num_cards / 3) img_index = ROCK;
	else if (i < num_cards / 3 * 2) img_index = PAPER;
	else img_index = SCISSOR;
	ds_list_add(card_types, img_index);
}

randomize();
ds_list_shuffle(card_types);

for (i = 0; i < num_cards; i++) {
	c = instance_create_layer(x, y, "Instances", obj_card);
	c.face_up = false;
	c.img_index = card_types[|i];
	ds_list_add(global.deck, c);
	global.deck[|i].target_y = deck_y + i * offset;
}