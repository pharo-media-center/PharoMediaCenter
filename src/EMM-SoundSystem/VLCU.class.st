Class {
	#name : #VLCU,
	#superclass : #FFIExternalUnion,
	#category : #'EMM-SoundSystem-Structure'
}

{ #category : #'field definition' }
VLCU class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^#(
		VLC_media_meta_changed vlcmmc;
		VLC_media_subitem_added vlcmsa;
		VLC_media_duration_changed vlcmdc;
		VLC_media_parsed_changed vlcmpc;
		VLC_media_freed vlcmf;
		VLC_media_state_changed vlcmsc;
		VLC_media_thumbnail_generated vlcmtg;
		VLC_media_subitemtree_added vlcmsa;
		VLC_media_player_buffering vlcmpb;
		VLC_media_player_chapter_changed vlcmpcc;
		VLC_media_player_position_changed vlcmppc;
		VLC_media_player_time_changed vlcmptc;
		VLC_media_player_title_changed vlcmptic;
		VLC_media_player_seekable_changed vlcmpsc;
		VLC_media_player_pausable_changed vlcmppc;
		VLC_media_player_scrambled_changed vlcmpsc;
		VLC_media_player_vout vlcmpv;
		VLC_media_list_item_added vlcmlia;
		VLC_media_list_will_add_item vlcmlwai;
		VLC_media_list_item_deleted vlcmlid;
		VLC_media_list_will_delete_item vlclwdi;
		VLC_media_list_player_next_item_set vlcmlpnis;
		VLC_media_player_snapshot_taken vlcmpst;
		VLC_media_player_length_changed vlcmplc;
		VLC_media_player_media_changed vlcmpmc;
		VLC_media_player_es_changed vlcmpec;
		VLC_media_player_audio_volume vlcmpav;
		VLC_media_player_audio_device vlcmpad;
		VLC_renderer_discoverer_item_added vlcrdia;
		VLC_renderer_discoverer_item_deleted vlcrdid;
 	)
]
