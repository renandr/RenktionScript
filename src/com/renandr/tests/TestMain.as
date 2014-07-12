package com.renandr.tests {
	import com.renandr.renk.starling.StarlingContainer;
	import com.renandr.tests.feathers.ButtonAlertTest;
	import com.renandr.tests.feathers.ButtonGroupAlertTest;
	import com.renandr.tests.feathers.listTest.ListTest;
	import com.renandr.tests.feathers.listTest2.ListTest2;

	public class TestMain extends StarlingContainer {
		
		public var bat: ButtonAlertTest;
		public var bgat: ButtonGroupAlertTest;
		public var tlt: ListTest;
		public var tlt2: ListTest2;
		
		[SWF(width="800", height="450", frameRate="50", backgroundColor="0")]
		public function TestMain() {
			//super(ButtonAlertTest);
			//super(ButtonGroupAlertTest);
			//super(ListTest);
			super(ListTest2);
		}
	}
}
