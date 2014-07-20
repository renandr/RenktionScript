package com.renandr.tests {
	import starling.core.Starling;

	import com.renandr.renk.starling.StarlingContainer;
	import com.renandr.tests.feathers.ButtonAlertTest;
	import com.renandr.tests.feathers.ButtonGroupAlertTest;
	import com.renandr.tests.feathers.accessoryTest.AccessoryTest;
	import com.renandr.tests.feathers.listChangeSelectionTest.ListChangeSelectionTest;
	import com.renandr.tests.feathers.listChangeTest.ListsChangeTest;

	public class TestMain extends StarlingContainer {
		
		public var bat: ButtonAlertTest;
		public var bgat: ButtonGroupAlertTest;
		public var at: AccessoryTest;
		public var lct: ListsChangeTest;
		public var lcst: ListChangeSelectionTest;
		
		[SWF(width="800", height="450", frameRate="50", backgroundColor="0")]
		
		public function TestMain() {
			//super(ButtonAlertTest);
			//super(ButtonGroupAlertTest);
			//super(AccessoryTest);
			//super(ListsChangeTest);
			super(ListChangeSelectionTest);
			
			
			Starling.multitouchEnabled = false;
		}
	}
}
