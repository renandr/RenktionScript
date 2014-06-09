package renk {
	import flash.display.MovieClip;	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;		

	public dynamic class ExternalSWF extends Sprite {
		//var
		private var imageLoader 	: Loader;
		private var _loaded			: Boolean = false;
		private var _loading		: Boolean = false;
		private var _url			: String;
		public var loadedPct 		: Number;
		public var loadedMovie 		: MovieClip;


		
		public function ExternalSWF(url:String = null) {
			super();
			if(url)_url = url;
		}
		public function load(url:String = null):void{
			if(_loaded || _loading)return;
			_loading = true;
			if(!url)url = _url;
			_url = url;
			//trace("loading ",url);
			imageLoader = new Loader();
			
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
			imageLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			var fileRequest : URLRequest = new URLRequest(url);
			imageLoader.load(fileRequest);
		}
		private function onProgress(event : ProgressEvent) : void {
			loadedPct = event.bytesLoaded/event.bytesTotal;
			//trace(loadedPct);
		}

		private function imageLoaded(event : Event) : void {
			loadedMovie = MovieClip(event.target.loader.content);
			loadedMovie.gotoAndStop(0);
			this.addChild(loadedMovie);
			_loaded = true;
			_loading = false;
			//dispatchEvent(new Event(Event.COMPLETE));
			dispatchEvent(event);
		}
		
		//GETSETS
		public function get loaded() : Boolean {
			return _loaded;
		}
		
		public function get url() : String {
			return _url;
		}
		
		public function get loading() : Boolean {
			return _loading;
		}
	}
}
