package com.renandr.youtubenizer {
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	public class YouTubeConnector {
		private static var _ME : YouTubeConnector = new YouTubeConnector();
		private var loader:URLLoader;
		
		public function searchPlaylistFrom(channelId : String):void{
			var string : String = 'https://www.googleapis.com/youtube/v3/search?';
			string += 'fields=nextPageToken,items(id/videoId,snippet/publishedAt,snippet/title)';
			string += '&part=snippet';
			string += '&type=videos';
			string += '&channelId='+channelId;
			string += '&key=AIzaSyAHzXnEmUfy-1wpLxp4fymFbcF0y1mCNQw';
			
			loader = new URLLoader();
			configureListeners(loader);

            var request:URLRequest = new URLRequest(string);
            try {
                loader.load(request);
            } catch (error:Error) {
                trace("Unable to load beause " + error);
            }
        }

        private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, handleComplete);

            dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleError);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, handleError);
        }

        private function handleComplete(event:Event):void {
            var loader:URLLoader = URLLoader(event.target);
            trace("completeHandler: " + loader.data);
        }

        private function handleError(event:Event):void {
			if(event is SecurityErrorEvent){
				trace("securityErrorHandler: " + event);
			}else if(event is HTTPStatusEvent){
				trace("httpStatusHandler: " + event);
			}else if(event is IOErrorEvent){
				trace("ioErrorHandler: " + event);
			}
            
        }

		public function YouTubeConnector() {
			super();
			if(_ME)throw new Error("Singleton");
			_ME = this;
		}
		static public function get ME() : YouTubeConnector {
			return _ME;
		}
	}
}
