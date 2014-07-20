package com.renandr.tests.feathers.listChangeTest {
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;

	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class ItemFactory {
		private static var _ME : ItemFactory = new ItemFactory();

		public function ItemFactory() {
			if (_ME) throw (new Error(""));
			_ME = this;
		}

		public function renderSimpleProduct() : IListItemRenderer {
			var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.labelField = "name";
			renderer.height = 20;
			return renderer;
		}

		static public function get ME() : ItemFactory {
			return _ME;
		}
	}
}
