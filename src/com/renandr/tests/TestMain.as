package com.renandr.tests {
	import com.renandr.renk.StarlingContainer;
	import com.renandr.tests.feathers.ButtonAlertTest;

	public class TestMain extends StarlingContainer {
		[SWF(width="800", height="450", frameRate="50", backgroundColor="0")]
		public function TestMain() {
			super(ButtonAlertTest);
		}
	}
}
