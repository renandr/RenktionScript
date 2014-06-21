package com.renandr.renk.starling.feathers {
	import starling.display.DisplayObject;
	public class ButtonGroupVO {
		public var label : String;
		public var triggered : Function;
		public var change : Function;
		public var defaultIcon : DisplayObject;
		public var upIcon : DisplayObject;
		public var downIcon : DisplayObject;
		public var hoverIcon : DisplayObject;
		public var disabledIcon : DisplayObject;
		public var defaultSelectedIcon : DisplayObject;
		public var selectedUpIcon : DisplayObject;
		public var selectedDownIcon : DisplayObject;
		public var selectedHoverIcon : DisplayObject;
		public var selectedDisabledIcon : DisplayObject;
		public var isSelected : Boolean = false;
		public var isToggle : Boolean = false;
		public var isEnabled : Boolean = true;

		public function ButtonGroupVO(label:String = null) {
			this.label = label;
		}
	}
}
