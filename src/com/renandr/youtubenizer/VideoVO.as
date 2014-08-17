package com.renandr.youtubenizer {
	public class VideoVO {
		private var videoId : String;
		private var publishDate : String;
		private var title : String;

		public function VideoVO(obj : Object) {
			///videoId = obj["id"]["videoId"];
			publishDate = obj["snippet"]["publishedAt"];
			title = obj["snippet"]["title"];
		}
	}
}
