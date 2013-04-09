package {
	import apps.AR.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageDisplayState;
	
	[SWF(width="640", height="480", frameRate="30", backgroundColor="#000000")]
	
	public class FLARManager_AppLauncher extends Sprite {
		
		public function FLARManager_AppLauncher () {
			
			this.addChild(new MarkerVideoTrigger()); //launch the marker video trigger app
			
			this.stage.addEventListener(MouseEvent.CLICK, this.toggleFullScreen);
			
		}//end constructor
		
		//toggle fullscreen on click
		
		private function toggleFullScreen(event:MouseEvent):void {
			if(stage.displayState == StageDisplayState.NORMAL) {
				stage.displayState = StageDisplayState.FULL_SCREEN;
			} else {
				stage.displayState = StageDisplayState.NORMAL;
			}
		} 
	}
}