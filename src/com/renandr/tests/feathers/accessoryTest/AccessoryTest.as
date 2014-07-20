package com.renandr.tests.feathers.accessoryTest {
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.renderers.BaseDefaultItemRenderer;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.themes.AeonDesktopTheme;

	import starling.display.DisplayObject;

	import com.renandr.renk.starling.StarlingMain;

	import flash.utils.Dictionary;

	public class AccessoryTest extends StarlingMain {
		
		private static var cachedAccessories : Dictionary = new Dictionary();
		
		public function AccessoryTest() {
			super();
		}

		override protected function init() : void {
			new AeonDesktopTheme();

			var productList : List = new List();
			productList.dataProvider = new ListCollection([
				{"name":"aaaaa"},
				{"name":"bbbbb"},
				{"name":"ccccc"},
				{"name":"ddddd"},
				{"name":"eeeee"},
				{"name":"fffff"}
			]);
			productList.itemRendererFactory = renderProduct;
			addChild(productList);

			productList.x = 10;
			productList.y = 10;
			productList.height = 300;
			productList.width = 150;
		}
		public function renderProduct() : IListItemRenderer {
			var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.accessoryFunction = productAccessory;
			renderer.layoutOrder = BaseDefaultItemRenderer.LAYOUT_ORDER_LABEL_ACCESSORY_ICON;
			renderer.verticalAlign = BaseDefaultItemRenderer.VERTICAL_ALIGN_TOP;
			renderer.accessoryPosition = BaseDefaultItemRenderer.ACCESSORY_POSITION_BOTTOM;
			renderer.height = 20;
			return renderer;
		}

		public function productAccessory(item : Object) : DisplayObject {
			if (item in cachedAccessories) {
				return cachedAccessories[item];
			}
			var accessory : Label = new Label();
			accessory.text = "test";
			cachedAccessories[item] = accessory;
			return accessory;
		};
	}
	// class
}
