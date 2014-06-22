package com.renandr.tests {
	import com.renandr.tests.feathers.ListTest;
	import com.renandr.renk.starling.StarlingContainer;
	import com.renandr.tests.feathers.ButtonAlertTest;
	import com.renandr.tests.feathers.ButtonGroupAlertTest;

	public class TestMain extends StarlingContainer {
		
		public var bat: ButtonAlertTest;
		public var bgat: ButtonGroupAlertTest;
		public var tlt: ListTest;
		
		[SWF(width="800", height="450", frameRate="50", backgroundColor="0")]
		public function TestMain() {
			//super(ButtonAlertTest);
			//super(ButtonGroupAlertTest);
			super(ListTest);
		}
	}
}
