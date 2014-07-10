package com.renandr.renk.starling {
	import starling.core.Starling;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	public class StarlingContainer extends Sprite {
		
		private static var _stageResized : Signal = new Signal();
		
		private var starling : Starling;
		private var starlingClass : Class;
		
		public function StarlingContainer(starlingClass:Class) {
			this.starlingClass = starlingClass;
			addEventListener(Event.ADDED_TO_STAGE, handleStage);
		}

		private function handleStage(event : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, handleStage);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stage.addEventListener(Event.RESIZE, handleRezise);
			handleRezise();
			
			Starling.handleLostContext = true;
			
			starling = new Starling(starlingClass, stage);
			starling.antiAliasing = 1;
			starling.start();
		}

		private function handleRezise(event : Event = null) : void {
			StarlingMain._resolution.width = stage.stageWidth; 
			StarlingMain._resolution.height = stage.stageHeight;
			_stageResized.dispatch();
		}


		static public function get stageResized() : Signal {
			return _stageResized;
		}
		
	}
}
