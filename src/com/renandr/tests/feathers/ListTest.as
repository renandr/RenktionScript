package com.renandr.tests.feathers {
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.themes.AeonDesktopTheme;

	import starling.display.Quad;
	import starling.events.Event;

	import com.renandr.renk.starling.StarlingMain;

	public class ListTest extends StarlingMain {
		private var bgResizeBack : Quad;
		private var bgResizeFront : Quad;
		
		[Embed(source='receipt.json', mimeType='application/octet-stream')]
		private static const ReceiptData : Class;

		public function ListTest() {
			super();
		}

		override protected function init() : void {
			new AeonDesktopTheme();

			bgResizeBack = addChild(new Quad(10, 10, 0x000000)) as Quad;
			bgResizeFront = addChild(new Quad(10, 10, 0xcccccc)) as Quad;
			bgResizeFront.x = 2;
			bgResizeFront.y = 2;
			
			var something : String = new ReceiptData();
			var somethingData : Object = JSON.parse(something);
			
			var list : List = new List();
			list.dataProvider = new ListCollection([
				{text:"Milk"}, 
				{text:"Eggs"}, 
				{text:"Bread"}, 
				{text:"Chicken"}
			]);
			list.itemRendererFactory = listFactory;
			//list.addEventListener(Event.CHANGE, list_changeHandler);
			addChild(list);
		}
		
		private function listFactory() : IListItemRenderer {
				var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
				renderer.labelField = "text";
				return renderer;
			};

		override protected function updatePositions() : void {
			bgResizeBack.width = resolution.width;
			bgResizeBack.height = resolution.height;
			bgResizeFront.width = resolution.width - 4;
			bgResizeFront.height = resolution.height - 4;
		}
	}
	// class
}
