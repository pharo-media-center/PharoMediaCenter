Class {
	#name : #PMCQueueModule,
	#superclass : #PMCModule,
	#traits : 'PMCTDisplayList',
	#classTraits : 'PMCTDisplayList classTrait',
	#category : #'PMC-WebApplication-Core'
}

{ #category : #accessing }
PMCQueueModule class >> priority [
	^ 4
]

{ #category : #rendering }
PMCQueueModule >> musicTitleId [
	^ 'musicTitleId'
]

{ #category : #rendering }
PMCQueueModule >> renderContentOn: html [
	| datas |
	datas := self session model playList.

	html mdlGrid
		noSpacing;
		shadow: 4;
		with: [ html mdlCell
				size: 4;
				with: [ html mdlButton
						onClick: (html jQuery ajax callback: [ self session model previous ]);
						icon;
						with: [ html mdlIcon: 'skip_previous' ].
					self session model isPlaying
						ifTrue: [ html mdlAnchorButton
								callback: [ self session model pause ];
								icon;
								with: [ html mdlIcon: 'pause_circle_filled' ] ]
						ifFalse: [ html mdlAnchorButton
								callback: [ self session model play ];
								icon;
								with: [ html mdlIcon: 'play_circle_filled' ] ].

					html mdlButton
						onClick: (html jQuery ajax callback: [ self session model next ]);
						icon;
						with: [ html mdlIcon: 'skip_next' ] ].
			html mdlCell
				size: 6;
				with: [ html paragraph
						id: self musicTitleId;
						with: (self session model currentPlayable ifNotNil: [ :song | song title ifNil: [ song name ] ] ifNil: [ '' ]) ] ].
	html render: (MDLProgressBarWidget progression: [ self session model musicPlayer currentPosition ]).

	html div
		id: self listId;
		with: [ self renderListOn: html ].

	self renderJavaScriptOn: html
]

{ #category : #rendering }
PMCQueueModule >> renderJavaScriptOn: html [
	html script: '
var conn = {};
var musicTitle = document.getElementById("', self musicTitleId , '");
 
if (window.WebSocket === undefined) {
  state.innerHTML = "(WebSockets not supported)";
} else {
    conn = new WebSocket("ws://localhost:8041/emm");
    conn.onopen = function () {
      musicTitle.innerHTML = "WebSocket: Connected";
    };
 
    conn.onmessage = function (event) {
      musicTitle.innerHTML =  event.data ;
    };

	conn.onerror = function (event) { 
		musicTitle.innerHTML = "WebSocket: Error"
	};
	   
    conn.onclose = function (event) {
      musicTitle.innerHTML = "WebSocket: Closed";
    };
};'
]

{ #category : #accessing }
PMCQueueModule >> size [
	^ 8
]
