package com.renandr.youtubenizer {
	import starling.core.Starling;

	import com.renandr.renk.starling.StarlingContainer;
	import com.renandr.tests.feathers.ButtonAlertTest;
	import com.renandr.tests.feathers.ButtonGroupAlertTest;
	import com.renandr.tests.feathers.accessoryTest.AccessoryTest;
	import com.renandr.tests.feathers.listChangeSelectionTest.ListChangeSelectionTest;
	import com.renandr.tests.feathers.listChangeTest.ListsChangeTest;

	public class Main extends StarlingContainer {
		
		[SWF(width="800", height="450", frameRate="50", backgroundColor="0")]
		
		public function Main() {
			super(YouTubenizer);
			Starling.multitouchEnabled = false;
		}
	}
}
