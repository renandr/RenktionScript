package com.renandr.youtubenizer {
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	import feathers.themes.AeonDesktopTheme;

	import starling.events.Event;

	import com.renandr.renk.starling.StarlingMain;

	public class YouTubenizer extends StarlingMain {
		private static var _ME : YouTubenizer;
		
		private var searchInput : TextInput;
		private var currentVideo : Object;
		private var searchButton : Button;
		
		override protected function init() : void {
			new AeonDesktopTheme();
			
			searchInput = new TextInput();
			searchInput.textEditorFactory = MainFactory.ME.renderSearchInput;
			searchInput.height = 38;
			addChild(searchInput);
			
			searchButton = new Button();
			searchButton.label = "Search";
			searchButton.width = 100;
			searchButton.height = 50;
			addChild(searchButton);
			searchButton.validate();
			searchButton.addEventListener(Event.TRIGGERED, handleSearchClick);
			searchButton.height = searchInput.height;
		}

		override protected function updatePositions():void{
			searchInput.x = 40;
			searchInput.y = 20;
			searchInput.width = 300;
			
			searchButton.x =  searchInput.x + searchInput.width + 10;
			searchButton.y = searchInput.y;
		}
		
		private function handleSearchClick(event : Event) : void {
			//UCBJycsmduvYEL83R_U4JriQ
			YouTubeConnector.ME.searchPlaylistFrom(searchInput.text);
			//YouTubeConnector.searchResponse.add(searchFinished);
		}
		
		public function showVideo(video:Object):void{
			if(currentVideo == video)return;
			currentVideo = video;
			//descriptionLabel.text = currentVideo.description;
		}

		public function YouTubenizer() {
			super();
			if(_ME)throw new Error("Singleton");
			_ME = this;
		}
		static public function get ME() : YouTubenizer {
			return _ME;
		}

	}//class
}
