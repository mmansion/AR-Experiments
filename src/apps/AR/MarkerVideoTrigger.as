package apps.AR {
	
	import com.transmote.flar.FLARManager;
	import com.transmote.flar.marker.FLARMarkerEvent;
	import com.transmote.flar.tracker.FLARToolkitManager;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public class MarkerVideoTrigger extends Sprite {
		
		private var flarManager:FLARManager;
		
		//instantiate variables for the video player and netstream objects
		private var player1:Video;
		private var player2:Video;
		private var nc1:NetConnection;
		private var nc2:NetConnection;
		private var stream1:NetStream;
		private var stream2:NetStream;
		
		
		public function MarkerVideoTrigger() {
			
			//create two separate video objects, representing two screens
			player1 = new Video();
			player2 = new Video();
			
			//add the video elements to the stage
			this.addChild(player1);
			this.addChild(player2);
			
			//create a two network connections for loading the flv videos
			nc1 = new NetConnection();
			nc2 = new NetConnection();
			
			//connect both connections
			nc1.connect(null);
			nc2.connect(null);
			
			//create two netstreams for the videos
			stream1 = new NetStream(nc1);
			stream2 = new NetStream(nc2);
			
			//attach the players to the network streams
			player1.attachNetStream(stream1);
			player2.attachNetStream(stream2);
			
			//hack to get around a security violation 
			//ref: http://www.actionscript.org/forums/showthread.php3?t=249523
			stream1.client={onMetaData:function(obj:Object):void{} }
			stream2.client={onMetaData:function(obj:Object):void{} }
				
			this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
			
		}
		
		private function onAdded (evt:Event) :void {
			
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onAdded);
			
			// pass the path to the FLARManager xml config file into the FLARManager constructor.
			// FLARManager creates and uses a FLARCameraSource by default.
			// the image from the first detected camera will be used for marker detection.
			// also pass an IFLARTrackerManager instance to communicate with a tracking library,
			// and a reference to the Stage (required by some trackers).
			this.flarManager = new FLARManager("../resources/flar/flarConfig.xml", new FLARToolkitManager(), this.stage);
			
			// to switch tracking engines, pass a different IFLARTrackerManager into FLARManager.
			// refer to this page for information on using different tracking engines:
			// http://words.transmote.com/wp/inside-flarmanager-tracking-engines/
			//			this.flarManager = new FLARManager("../resources/flar/flarConfig.xml", new FlareManager(), this.stage);
			//			this.flarManager = new FLARManager("../resources/flar/flarConfig.xml", new FlareNFTManager(), this.stage);
			
			// add FLARManager.flarSource to the display list to display the video capture.
			//this.addChild(Sprite(this.flarManager.flarSource));
			

			// begin listening for FLARMarkerEvents.
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_ADDED, this.onMarkerAdded);
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_UPDATED, this.onMarkerUpdated);
			this.flarManager.addEventListener(FLARMarkerEvent.MARKER_REMOVED, this.onMarkerRemoved);
		}
		
		private function onMarkerAdded (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] added");
			
			var videoID:int = evt.marker.patternId;//determine which pattern was recognized
			
			this.playVideo(videoID);
		}
		
		private function onMarkerUpdated (evt:FLARMarkerEvent) :void {
			//			trace("["+evt.marker.patternId+"] updated");
		}
		
		private function onMarkerRemoved (evt:FLARMarkerEvent) :void {
			trace("["+evt.marker.patternId+"] removed");
		}
		
		private function playVideo(videoID:int): void {
			//pass a video id into the function to start playing
			switch(videoID) {
			case 7:
				stream1.close(); //stop video before loading a new video
				stream1.play("../resources/videos/video1.flv");
				break;
			case 1:
				break;
			default:
				break;
			}
		}
	}
}