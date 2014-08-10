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
		private var videoList : Vector.<VideoVO>;
		private var currentTotalResults : int = 0;
		
		
		public function searchPlaylistFrom(channelId : String):void{
			var string : String = 'https://www.googleapis.com/youtube/v3/search?';
			string += 'key=AIzaSyAHzXnEmUfy-1wpLxp4fymFbcF0y1mCNQw';
			string += '&type=videos';
			string += '&channelId='+channelId;
			string += '&part=snippet';
			string += '&fields=pageInfo/totalResults,nextPageToken,items(id/videoId,snippet/publishedAt,snippet/title)';
			
			videoList = null;
			loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, handleComplete);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
            loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleError);
            loader.addEventListener(IOErrorEvent.IO_ERROR, handleError);

            var request:URLRequest = new URLRequest(string);
            try {
                loader.load(request);
            } catch (error:Error) {
                trace("Unable to load beause " + error);
            }
        }


        private function handleComplete(event:Event):void {
            trace("completeHandler: " + loader.data);
			var paramsObj : Object = JSON.parse(loader.data);
			if(!videoList){
				videoList = new <VideoVO>[];
				currentTotalResults = paramsObj['totalResults'];
			}
			var paramList : Array = paramsObj['items'];
			for each (var videoObj : Object in paramList) {
				videoList.push(new VideoVO(videoObj));
			}
			//TODO call next pages
        }

        private function handleError(event:Event):void {
			if(event is SecurityErrorEvent){
				//trace("securityErrorHandler: " + event);
			}else if(event is HTTPStatusEvent){
				//trace("httpStatusHandler: " + event);
			}else if(event is IOErrorEvent){
				//trace("ioErrorHandler: " + event);
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
