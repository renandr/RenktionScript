package com.renandr.youtubenizer {
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.StageTextTextEditor;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextEditor;
	import feathers.core.ITextRenderer;

	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	import flash.utils.getTimer;

	public class MainFactory {
		private static var _ME : MainFactory = new MainFactory();
		private static const DOUBLE_TAP_TIME : int = 300;
		private var lastClickTime : int;

		static public function get ME() : MainFactory {
			return _ME;
		}

		public function MainFactory() {
			if (_ME) throw (new Error(""));
			_ME = this;
		}
		
		public function renderSearchInput():ITextEditor{
		    var editor:StageTextTextEditor = new StageTextTextEditor();
		    editor.fontFamily = "Arial, Helvetica";
		    editor.fontSize = 22;
		    editor.color = 0x333333;
		    return editor;
		}

		public function renderVideoItem() : IListItemRenderer {
			var renderer : DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.height = 40;
			renderer.labelFactory = renderVideoItemLabel;
			renderer.labelFunction = drawVideoItemLabel;
			renderer.addEventListener(TouchEvent.TOUCH, handleVideoItemTouch);
			return renderer;
		}

		private function renderVideoItemLabel() : ITextRenderer {
			var label : TextFieldTextRenderer = new TextFieldTextRenderer();
			label.isHTML = true;
			//label.border = true;
			return label;
		}

		private function drawVideoItemLabel(product : Object) : String {
			return "<b>Name:</b><br/>" + product["name"];
		}

		private function handleVideoItemTouch(event : TouchEvent) : void {
			var videoItem : DefaultListItemRenderer = event.currentTarget as DefaultListItemRenderer;
			var touches : Vector.<Touch> = event.getTouches(videoItem);
			for each (var touch : Touch in touches) {
				switch(touch.phase) {
					case TouchPhase.ENDED:
						if (lastClickTime > 0 && (getTimer() - lastClickTime) < DOUBLE_TAP_TIME) {
							YouTubenizer.ME.showVideo(videoItem.data);
							lastClickTime = 0;
						} else lastClickTime = getTimer();
						break;
				}
			}
		}

		public function  renderDescriptionLabel() : ITextRenderer {
			var textRenderer : TextFieldTextRenderer = new TextFieldTextRenderer();
			textRenderer.wordWrap = true;
			textRenderer.background = true;
			textRenderer.backgroundColor = 0xCEFEDE;
			return textRenderer;
		}
	}
}
