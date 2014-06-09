package com.renandr.youtubenizer {
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;

	import flash.geom.Rectangle;

	public class YouTubenizer extends Sprite {
		private static var _ME : YouTubenizer;
		private var resizeTest : Quad;
		private var resizeTest2 : Quad;

		public function YouTubenizer() {
			super();
			if(_ME)throw new Error("Singleton");
			_ME = this;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, handleStage);

		}

		private function handleStage(event : starling.events.Event) : void {
			Main.stageResized.add(handleResize);
			handleResize();
		}

		private function handleResize():void{
			var viewPortRectangle : Rectangle = new Rectangle();
			viewPortRectangle.width = Main.resolution.width; 
			viewPortRectangle.height = Main.resolution.height;

			Starling.current.viewPort = viewPortRectangle;

			updateTest();

			stage.stageWidth = Main.resolution.width;
			stage.stageHeight = Main.resolution.height;
		}
		
		private function updateTest() : void {
			if (!resizeTest) {
				trace("what the fuck");
				resizeTest = addChild(new Quad(10, 10, 0x000000)) as Quad;
				resizeTest2 = addChild(new Quad(10, 10,  0xff0000)) as Quad;
				resizeTest2.x = 2; resizeTest2.y = 2;
			}
			resizeTest.width = Main.resolution.width;
			resizeTest.height = Main.resolution.height;
			resizeTest2.width = Main.resolution.width-4;
			resizeTest2.height = Main.resolution.height-4;

		}

		static public function get me() : YouTubenizer {
			return _ME;
		}

	}//class
}
