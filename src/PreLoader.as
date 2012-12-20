/**
 * @project LD25
 * @package 
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file PreLoader.as
 */
package {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class PreLoader extends MovieClip {
		[Embed(source="/loading.png")] protected var LOADING:Class;
		
		public function PreLoader() {
			stop();			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private var loading:Bitmap;
		private function create():void {
			loading = new LOADING;
			loading.x = 180;
			loading.y = 140;
			loading.scaleX = 2;
			loading.scaleY = 2;
			addChild(loading);
		}
		
		private var created:Boolean = false;
		private function onEnterFrame(event:Event):void {
			if (!created) {
				create();
				created = true;
			} else {
				if (framesLoaded >= totalFrames) {
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					removeChild(loading);
					nextFrame();
					addChild(new main);
				}
			}
		}
	}
}