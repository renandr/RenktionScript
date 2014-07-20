package com.renandr.tests.feathers.listChangeSelectionTest {
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;

	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	import flash.text.TextFormat;
	import flash.utils.getTimer;

	public class ProductItemFactory {
		
		private static var _ME : ProductItemFactory = new ProductItemFactory();
		
		private static const DOUBLE_TAP_TIME : int = 500;
		
		private var lastClickTime : int;

		static public function get ME() : ProductItemFactory {
			return _ME;
		}
		
		public function ProductItemFactory() {
			if (_ME) throw (new Error(""));
			_ME = this;
		}

		public function renderInteractiveProduct() : IListItemRenderer {
			var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.height = 20;
			renderer.labelField = "name";
			renderer.addEventListener(TouchEvent.TOUCH, handleProductTouch);
			return renderer;
		}
		
		private function handleProductTouch(event : TouchEvent) : void {
			var productRenderer : DefaultListItemRenderer = event.currentTarget as DefaultListItemRenderer;
			var touches : Vector.<Touch> = event.getTouches( productRenderer);
			for each (var touch : Touch in touches) {
				switch(touch.phase){
					case TouchPhase.ENDED:
						if(lastClickTime>0 && (getTimer() - lastClickTime)<DOUBLE_TAP_TIME){
							ListChangeSelectionTest.ME.showProduct(productRenderer.data);
							lastClickTime = 0;
						}else lastClickTime = getTimer();
						break;
				}
			}
		}

		public function  renderDescriptionLabel():ITextRenderer {
			var textRenderer : TextFieldTextRenderer = new TextFieldTextRenderer();
			textRenderer.wordWrap = true;
			textRenderer.background = true;
			textRenderer.backgroundColor = 0xCEFEDE;
            return textRenderer;
         }
	}
}
