package com.renandr.tests.feathers.listTest2 {
	import feathers.controls.Label;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;

	import com.renandr.renk.starling.feathers.BasicListItemRenderer;

	public class ProductListItemRenderer extends BasicListItemRenderer {
		private var titleLabel : Label;

		public function ProductListItemRenderer() {
		}

		override protected function initialize() : void {
			layout = new AnchorLayout();

			var labelLayoutData : AnchorLayoutData = new AnchorLayoutData();
			labelLayoutData.top = 0;
			labelLayoutData.right = 0;
			labelLayoutData.bottom = 0;
			labelLayoutData.left = 0;

			titleLabel = addChild(new Label()) as Label;
			titleLabel.layoutData = labelLayoutData;
			selectedChanged.add(onSelected);
			
			super.initialize();
		}

		override protected function commitData() : void {
			if (_data) {
				titleLabel.text = _data.name;
			}
		}
		
		private function onSelected() : void {
			trace(this, _data.name, isSelected);
		}

	}
}
