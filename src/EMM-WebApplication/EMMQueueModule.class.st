Class {
	#name : #EMMQueueModule,
	#superclass : #EMMModule,
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMQueueModule class >> priority [
	^ 4
]

{ #category : #rendering }
EMMQueueModule >> musicTitleId [
	^ 'musicTitleId'
]

{ #category : #rendering }
EMMQueueModule >> renderContentOn: html [
	| datas |
	datas := self session musicPlayer musicList.

	html mdlGrid
		noSpacing;
		shadow: 4;
		with: [ html mdlCell
				size: 4;
				with: [ html mdlAnchorButton
						callback: [ self session musicPlayer previousSound ];
						icon;
						with: [ html mdlIcon: 'skip_previous' ].
					self session musicPlayer isPlaying
						ifTrue: [ html mdlAnchorButton
								callback: [ self session musicPlayer pause ];
								icon;
								with: [ html mdlIcon: 'pause_circle_filled' ] ]
						ifFalse: [ html mdlAnchorButton
								callback: [ self session musicPlayer play ];
								icon;
								with: [ html mdlIcon: 'play_circle_filled' ] ].

					html mdlAnchorButton
						callback: [ self session musicPlayer nextSound ];
						icon;
						with: [ html mdlIcon: 'skip_next' ] ].
			html mdlCell
				size: 6;
				with: [ html paragraph id: self musicTitleId ;with: (self session musicPlayer currentMusic ifNotNil: [ :song | song title ] ifNil: [ '' ]) ] ].
	html render: (MDLProgressBarWidget progression: [ self session musicPlayer currentSound soundPosition ]).
	html mdlTable
		attributeAt: 'width' put: '100%';
		with: [ html
				tableHead: [ html
						tableRow: [ html mdlTableHeading
								nonNumerical;
								with: 'Title'.
							html mdlTableHeading: 'Lenght'.
							html mdlTableHeading: 'Author' ] ].
			html
				tableBody: [ datas
						do: [ :song | 
							html
								tableRow: [ html mdlTableCell
										nonNumerical;
										with: song title.
									html mdlTableCell
										nonNumerical;
										with: song artists asOrderedCollection first name.
									html mdlTableCell with: song length ] ] ] ].

	self renderJavaScriptOn: html
]

{ #category : #rendering }
EMMQueueModule >> renderJavaScriptOn: html [
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
	   
    /*conn.onclose = function (event) {
      musicTitle.innerHTML = "WebSocket: Closed";
    };*/
};'
]

{ #category : #accessing }
EMMQueueModule >> size [
	^ 8
]
