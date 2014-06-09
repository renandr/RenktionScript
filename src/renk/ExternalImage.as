package renk {
    import flash.display.DisplayObject;    
    import flash.geom.Point;    
    import flash.events.IOErrorEvent;	
    import flash.events.ProgressEvent;	
	import flash.display.Bitmap;	
	import flash.net.URLRequest;	
	import flash.events.Event;	
	import flash.display.Loader;	
	import flash.display.Sprite;
	
	public dynamic class ExternalImage extends Sprite {
		//var
		private var imageLoader 	: Loader;
		private var _loaded			: Boolean = false;
		private var _loading		: Boolean = false;
		private var _url			: String;
		private var _loadedBitmap	: Bitmap;
		private var originalSize	: Point;
		private var _maxSize 		: Point;
		private var _loadingClip 	: DisplayObject;
		public var loadedPct 		: Number;
		public var smoothImage 		: Boolean = false;
        public var align 			: String;
        public var userData			: *;

        
        public function ExternalImage(url:String = null) {
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
			imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
			var fileRequest : URLRequest = new URLRequest(url);
			imageLoader.load(fileRequest);
		}
		private function onProgress(event : ProgressEvent) : void {
			loadedPct = event.bytesLoaded/event.bytesTotal;
			//trace(loadedPct);
		}

		private function centerImg():void{
			if(!_loadedBitmap)return;
			if(align == "CENTER"){
				_loadedBitmap.x = -_loadedBitmap.width / 2;
                _loadedBitmap.y = -_loadedBitmap.height / 2;
                
            }else if(align == "BOTTON_CENTER"){
				_loadedBitmap.x = -_loadedBitmap.width / 2;
                _loadedBitmap.y = -_loadedBitmap.height;
                
			}else if(align == "TOP_CENTER"){
				_loadedBitmap.x = -_loadedBitmap.width / 2;
                _loadedBitmap.y = 0;
                
			}else if(align == "CENTER_RIGHT"){
				_loadedBitmap.x = 0;
                _loadedBitmap.y = -_loadedBitmap.height/2;
                
			}
		}
		private function imageLoaded(event : Event) : void {
			if(_loadingClip){
				if(_loadingClip.parent)_loadingClip.parent.removeChild(_loadingClip);
				_loadingClip = null;
			}
            var loader : Loader = Loader(event.target.loader);
            _loadedBitmap = Bitmap(loader.content);
            originalSize = new Point(_loadedBitmap.width, _loadedBitmap.height);
            if(smoothImage)_loadedBitmap.smoothing = true;
			this.addChild(_loadedBitmap);
			
			updateSize();
			
			_loaded = true;
			_loading = false;
			dispatchEvent(event);
		}
		public function set maxSize(siz:Point):void{
			_maxSize = siz;
			if(_loaded){
				updateSize();
            }
        }
        private function updateSize() : void {
        	if(_maxSize) {
        		if(originalSize.x>_maxSize.x){
        			this.width = _maxSize.x;
	        		scaleY = scaleX;
        		}
        		if(originalSize.y>_maxSize.y){
        			this.height = _maxSize.y;
	        		scaleX = scaleY;
        		}
        		/*
	            if(originalSize.x > originalSize.y) {
	                
	        	}else{
	        		this.height = _maxSize.y;
	        		scaleX = scaleY;
	        	}//*/
        	}
        	centerImg();
        }
		private function loadError(IOErrorEvent : Event) : void {
			trace("error loading", url);
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
        
        public function addLoadingClip(d : DisplayObject) : void {
        	_loadingClip = d;
        	addChild(_loadingClip);
        }
        
        public function get loadedBitmap() : Bitmap {
            return _loadedBitmap;
        }
    }
}
