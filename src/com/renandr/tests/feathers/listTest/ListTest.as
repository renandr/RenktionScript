package com.renandr.tests.feathers.listTest {
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.renderers.BaseDefaultItemRenderer;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.themes.AeonDesktopTheme;

	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.events.Event;

	import com.renandr.renk.starling.StarlingMain;

	public class ListTest extends StarlingMain {
		
		[Embed(source='receipt.json', mimeType='application/octet-stream')]
		private static const ReceiptData : Class;
		
		private var categories : Array;
		private var products : Array;
		
		private var bgResizeBack : Quad;
		private var bgResizeFront : Quad;
		
		private var categoryList : List;
		private var productList : List;	
		
		public function ListTest() {
			super();
		}

		override protected function init() : void {
			new AeonDesktopTheme();

			bgResizeBack = addChild(new Quad(10, 10, 0x000000)) as Quad;
			bgResizeFront = addChild(new Quad(10, 10, 0xcccccc)) as Quad;
			bgResizeFront.x = 2;
			bgResizeFront.y = 2;

			var receiptData : Object = JSON.parse(new ReceiptData());
			categories = receiptData["receipt"]["categories"];
			products = receiptData["receipt"]["products"];
			
			categoryList = new List();
			categoryList.allowMultipleSelection = true;
			categoryList.dataProvider = new ListCollection(categories);
			categoryList.itemRendererFactory = renderCategoryList;
			categoryList.addEventListener(Event.CHANGE, handleCategoryChange);
			addChild(categoryList);
			
			productList = new List();
			//var layout:VerticalLayout = new VerticalLayout();
			//layout.horizontalAlign = HorizontalAlign.LEFT;
	        //productList.layout = layout;
			productList.itemRendererFactory = renderProductList;
			addChild(productList);
			
			var selectedIndices : Vector.<int> = new <int>[];
			for (var i : int = 0; i < categories.length; i++)selectedIndices.push(i);
			categoryList.selectedIndices = selectedIndices;
		}

		override protected function updatePositions() : void {
			bgResizeBack.width = resolution.width;
			bgResizeBack.height = resolution.height;
			bgResizeFront.width = resolution.width - 4;
			bgResizeFront.height = resolution.height - 4;
			
			categoryList.x = 10;
			categoryList.y = 10;
			categoryList.height = resolution.height-20;
			categoryList.width = 100;
			
			productList.x = categoryList.x + categoryList.width + 5;
			productList.y = 10;
			productList.height = resolution.height-20;
			productList.width = 100;
		}

		private function renderCategoryList() : IListItemRenderer {
			var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.labelField = "name";
			
			return renderer;
		};
		
		private function renderProductList() : IListItemRenderer {
			var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.labelField = "name";
			return renderer;
		};
		private function handleCategoryChange(event : Event) : void {
			trace("change");
			var filteredProducts : Array = [];
			for each (var product : Object in products) {
				var productCategory : int = int(product["category"]);
				if(categoryList.selectedIndices.indexOf(productCategory)>=0 ){
					filteredProducts.push(product);
				}
			}
			productList.dataProvider = new ListCollection(filteredProducts);
		}
		
		
	}
	// class
}
