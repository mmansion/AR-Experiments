package {
	import apps.*;
	import apps.AR.MarkerVideoTrigger;
	
	import examples.*;
	
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.MouseEvent;

	[SWF(width="640", height="480", frameRate="60", backgroundColor="#FFFFFF")]
	
	public class FLARManagerExampleLauncher extends Sprite {
		
		public function FLARManagerExampleLauncher () {
			
			//var markerVideo:MarkerVideoTrigger = new MarkerVideoTrigger();
			
			this.addChild(new MarkerVideoTrigger());
			
			this.stage.addEventListener(MouseEvent.CLICK, this.toggleFullScreen);
			
			
//			this.addChild(new FLARManagerTutorial_2D());
//			this.addChild(new FLARManagerTutorial_3D());
//			this.addChild(new FLARManagerTutorial_Collada_Away3D());
//			this.addChild(new FLARManagerTutorial_Collada_PV3D());
			
			// 2D and 3D examples using only FLARManager and native AS3
//			this.addChild(new FLARManagerExample_2D());
//			this.addChild(new FLARManagerExample_Flash3D());

			// 3D examples using third-party 3D frameworks
//			this.addChild(new FLARManagerExample_Alternativa3D());
//			this.addChild(new FLARManagerExample_Away3D());
//			this.addChild(new FLARManagerExample_Away3DLite());
//			this.addChild(new FLARManagerExample_PV3D());
//			this.addChild(new FLARManagerExample_Sandy3D());
			
			// miscellaneous examples
//			this.addChild(new FLARManagerExample_2D_Loader());
//			this.addChild(new FLARManagerExample_Widescreen());
			
		}//end constructor
		
		
		private function toggleFullScreen(event:MouseEvent):void {
			
			if(stage.displayState == StageDisplayState.NORMAL) {
				
				stage.displayState = StageDisplayState.FULL_SCREEN;

			} else {
				
				stage.displayState = StageDisplayState.NORMAL;
			}
		} 
	}
}