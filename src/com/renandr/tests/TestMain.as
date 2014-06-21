package com.renandr.tests {
	import com.renandr.renk.starling.StarlingContainer;
	import com.renandr.tests.feathers.ButtonAlertTest;
	import com.renandr.tests.feathers.ButtonGroupAlertTest;

	public class TestMain extends StarlingContainer {
		
		public var bat: ButtonAlertTest;
		public var bgt: ButtonGroupAlertTest;
		
		[SWF(width="800", height="450", frameRate="50", backgroundColor="0")]
		public function TestMain() {
			//super(ButtonAlertTest);
			super(ButtonGroupAlertTest);
		}
	}
}
