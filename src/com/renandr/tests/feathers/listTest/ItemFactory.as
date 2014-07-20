package com.renandr.tests.feathers.listTest {
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;

	public class ItemFactory {
		
		private static var _ME : ItemFactory = new ItemFactory();

		public function ItemFactory() {
			if(_ME)throw (new Error(""));
			_ME = this;
		}

		
		public function product() : IListItemRenderer {
			var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.height = 20;
			return renderer;
		}

		static public function get ME() : ItemFactory {
			return _ME;
		}
	}
}
