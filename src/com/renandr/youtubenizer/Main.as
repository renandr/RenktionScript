package com.renandr.youtubenizer {
	import starling.core.Starling;
	import org.osflash.signals.Signal;
	import flash.geom.Rectangle;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.display.Sprite;
	
	[SWF(width="800", height="450", frameRate="50", backgroundColor="0")]
	public class Main extends Sprite {
		
		private static var _ME : Main;
		private static var _resolution : Rectangle;
		private static var _stageResized : Signal = new Signal();
		private var starling : Starling;
		
		
		public function Main() {
			if(_ME)throw new Error("Singleton");
			_ME = this;
			
			_resolution = new Rectangle();
			
			addEventListener(Event.ADDED_TO_STAGE, handleStage);
		}

		private function handleStage(event : Event) : void {
			trace('handleStage: ' + (stage));
			removeEventListener(Event.ADDED_TO_STAGE, handleStage);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stage.addEventListener(Event.RESIZE, handleRezise);
			handleRezise();
			
			Starling.handleLostContext = true;
			
			starling = new Starling(YouTubenizer, stage);
			starling.antiAliasing = 1;
			starling.start();
		}

		private function handleRezise(event : Event = null) : void {
			trace('handleRezise:', stage.stageWidth, stage.stageHeight);
			_resolution.width = stage.stageWidth; 
			_resolution.height = stage.stageHeight;
			_stageResized.dispatch();
		}




		public static function get me() : Main {
			return _ME;
		}

		static public function get stageResized() : Signal {
			return _stageResized;
		}

		static public function get resolution() : Rectangle {
			return _resolution;
		}
	}
}
