package com.renandr.renk.starling.feathers {
	import feathers.controls.renderers.LayoutGroupListItemRenderer;

	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	import org.osflash.signals.Signal;

	import flash.geom.Point;

	public class BasicListItemRenderer extends LayoutGroupListItemRenderer {
		private static const HELPER_POINT:Point = new Point();
		protected var selectedChanged : Signal = new Signal();
		
		protected var touchID:int = -1;
		

		public function BasicListItemRenderer() {
		}

		override protected function initialize() : void {
			super.initialize();
			addEventListener(TouchEvent.TOUCH, handleTouch);
			addEventListener( Event.REMOVED_FROM_STAGE, handleRemovedFromStage );
		}

		private function handleRemovedFromStage(event : Event) : void {
			touchID = -1;
		}

		private function handleTouch(event : TouchEvent) : void {
			if ( !_isEnabled ) {
				trace("if we were disabled while tracking touches, clear the touch id.");
				touchID = -1;
				return;
			}
			var touch : Touch;
			if ( touchID < 0 ) {
				touch = event.getTouch(this, TouchPhase.BEGAN);
				if ( !touch ) {
					return;
				}
				touchID = touch.id;
				return;
			} else {
				touch = event.getTouch(this, null, touchID);
				if ( !touch ) {
					return;
				}

				if ( touch.phase == TouchPhase.ENDED ) {
					touch.getLocation(stage, HELPER_POINT);
					var isInBounds : Boolean = contains(stage.hitTest(HELPER_POINT, true));
					if ( isInBounds ) {
						isSelected = !isSelected;
						selectedChanged.dispatch();
					}
					touchID = -1;
				}
			}
		}
	}
}
