package com.renandr.renk {
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;


	public class StarlingMain extends Sprite {
		internal static var _resolution : Rectangle = new Rectangle();
		public function StarlingMain() {
			addEventListener(Event.ADDED_TO_STAGE, handleStage);
		}
		
		private function handleStage(event : starling.events.Event) : void {
			init();
			StarlingContainer.stageResized.add(handleResize);
			handleResize();
		}

		protected function init() : void {
		}
		private function handleResize():void{
			var viewPortRectangle : Rectangle = new Rectangle();
			viewPortRectangle.width = resolution.width; 
			viewPortRectangle.height = resolution.height;
			Starling.current.viewPort = viewPortRectangle;

			updatePositions();

			stage.stageWidth = viewPortRectangle.width;
			stage.stageHeight = viewPortRectangle.height;
		}

		protected function updatePositions() : void {
		}
		
		static public function get resolution() : Rectangle {
			return _resolution;
		}
	}//class
}
