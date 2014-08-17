package com.renandr.youtubenizer {
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLVariables;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class YouTubeConnector {
		private static var _ME : YouTubeConnector = new YouTubeConnector();
		private var loader : URLLoader;
		private var videoList : Vector.<VideoVO>;
		private var currentTotalResults : int = 0;

		public function searchPlaylistFrom(searchText : String) : void {
			//searchVideos(searchText);
			searchChannels(searchText);
		}

		public function searchChannels(searchText : String) : void {
			searchText = 'marquesbrownlee';

			var url : String = 'https://www.googleapis.com/youtube/v3/channels?';
			url+= 'key=AIzaSyAHzXnEmUfy-1wpLxp4fymFbcF0y1mCNQw';
			url+= '&forUsername=' + searchText;
			url+= '&part=snippet';
			url += '&fields=items(id,snippet(title))';

			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, handleChannelsLoad);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleError);
			loader.addEventListener(IOErrorEvent.IO_ERROR, handleError);

			var request : URLRequest = new URLRequest(url);
			loader.load(request);
		}

		private function handleChannelsLoad(event : Event) : void {
			trace("handleChannelsLoad: " + loader.data);
			// var paramsObj : Object = JSON.parse(loader.data);
		}

		public function searchVideos(searchText : String) : void {
			searchText = 'UCBJycsmduvYEL83R_U4JriQ';

			var url : String = 'https://www.googleapis.com/youtube/v3/search?';
			url += 'type=videos&';
			url += 'key=AIzaSyAHzXnEmUfy-1wpLxp4fymFbcF0y1mCNQw';
			url += '&channelId=' + searchText;
			url += '&part=snippet';
			url += '&order=date';
			url += '&fields=pageInfo/totalResults,nextPageToken,items(id/videoId,snippet(title,publishedAt)';

			videoList = null;
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, handleVideosLoad);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleError);
			loader.addEventListener(IOErrorEvent.IO_ERROR, handleError);

			trace('requesting:\n'+url+'\n');
			var request : URLRequest = new URLRequest(url);
			loader.load(request);
		}

		private function handleVideosLoad(event : Event) : void {
			trace("completeHandler: " + loader.data);
			var paramsObj : Object = JSON.parse(loader.data);
			if (!videoList) {
				videoList = new <VideoVO>[];
				currentTotalResults = paramsObj['totalResults'];
			}
			var paramList : Array = paramsObj['items'];
			for each (var videoObj : Object in paramList) {
				videoList.push(new VideoVO(videoObj));
			}
			// TODO call next pages
		}

		private function handleError(event : Event) : void {
			if (event is SecurityErrorEvent) {
				trace("securityErrorHandler: " + event);
			} else if (event is HTTPStatusEvent) {
				trace("httpStatusHandler: " + event);
			} else if (event is IOErrorEvent) {
				trace("ioErrorHandler: " + event);
			}
		}

		public function YouTubeConnector() {
			super();
			if (_ME) throw new Error("Singleton");
			_ME = this;
		}

		static public function get ME() : YouTubeConnector {
			return _ME;
		}
	}
}
