package com.renandr.tests.feathers {
	import feathers.controls.Alert;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	import feathers.themes.AeonDesktopTheme;

	import starling.display.Quad;
	import starling.events.Event;

	import com.renandr.renk.starling.StarlingMain;
	import com.renandr.renk.starling.feathers.ButtonGroupVO;

	public class ButtonGroupAlertTest extends StarlingMain {
		private var bgResizeBack : Quad;
		private var bgResizeFront : Quad;
		
		private var group : ButtonGroup; 

		public function ButtonGroupAlertTest() {
			super();
		}

		override protected function init() : void {
			new AeonDesktopTheme();

			bgResizeBack = addChild(new Quad(10, 10, 0x000000)) as Quad;
			bgResizeFront = addChild(new Quad(10, 10, 0xcccccc)) as Quad;
			bgResizeFront.x = 2;
			bgResizeFront.y = 2;
			
			group = new ButtonGroup();

			var defaultSelectedButton : ButtonGroupVO;
			var buttonList : ListCollection = new ListCollection([
				defaultSelectedButton = new ButtonGroupVO("Button0"),
				new ButtonGroupVO("Button1"),
				new ButtonGroupVO("Button2")
			]);
			defaultSelectedButton.isSelected = true;
			
			group.addEventListener(Event.TRIGGERED, handleButtonClick);
			group.dataProvider = buttonList;
			group.gap = 10;
			this.addChild(group);
			group.validate();
		}

		override protected function updatePositions() : void {
			bgResizeBack.width = resolution.width;
			bgResizeBack.height = resolution.height;
			bgResizeFront.width = resolution.width - 4;
			bgResizeFront.height = resolution.height - 4;
			
			group.x = (resolution.width - group.width) / 2;
			group.y = (resolution.height - group.height) / 2;
		}
		
		private function handleButtonClick ( event:Event, data:ButtonGroupVO ):void{
    	    Alert.show( 
				"The button with label \"" + data.label + "\" was triggered.",
				"Button clicked", 
				new ListCollection([{label:"OK"}]) 
			);
		}
	}
	// class
}
