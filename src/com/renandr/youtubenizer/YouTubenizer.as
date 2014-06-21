package com.renandr.youtubenizer {
	import feathers.themes.AeonDesktopTheme;

	import com.renandr.renk.starling.StarlingMain;

	public class YouTubenizer extends StarlingMain {
		private static var _ME : YouTubenizer;

		public function YouTubenizer() {
			super();
			if(_ME)throw new Error("Singleton");
			_ME = this;
		}

		override protected function init() : void {
			new AeonDesktopTheme();
			
		}

		override protected function updatePositions():void{
		}

		static public function get me() : YouTubenizer {
			return _ME;
		}

	}//class
}
