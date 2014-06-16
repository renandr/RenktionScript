package com.renandr.tests.feathers {
	import feathers.controls.Button;
	import feathers.themes.AeonDesktopTheme;

	import starling.display.Quad;

	import com.renandr.renk.StarlingMain;

	public class ButtonAlertTest extends StarlingMain {
		private static var _ME : ButtonAlertTest;
		private var bgResizeBack : Quad;
		private var bgResizeFront : Quad;
		private var button : Button;

		public function ButtonAlertTest() {
			super();
			if(_ME)throw new Error("Singleton");
			_ME = this;
		}

		override protected function init() : void {
			new AeonDesktopTheme();
			
			bgResizeBack = addChild(new Quad(10, 10, 0x000000)) as Quad;
			bgResizeFront = addChild(new Quad(10, 10,  0xcccccc)) as Quad;
			bgResizeFront.x = 2; bgResizeFront.y = 2;
				
			button = new Button();
			button.label = "Click Me";
			button.width = 100;
			button.height = 50;
			addChild( button );
			button.validate();
		}
		override protected function updatePositions():void{
			bgResizeBack.width = resolution.width;
			bgResizeBack.height = resolution.height;
			bgResizeFront.width = resolution.width-4;
			bgResizeFront.height = resolution.height-4;
			
			button.x = (resolution.width - button.width) / 2;
			button.y = (resolution.height - button.height) / 2;
		}

		static public function get me() : ButtonAlertTest {
			return _ME;
		}

	}//class
}
