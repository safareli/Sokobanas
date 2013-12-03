package  {

	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event; 
	// import com.greensock.*; 
	// import com.greensock.easing.*;


	// extend ResponsiveScene from main class and 
	// set m_scene to MovieClip object with sould be scaled 
	public class ResponsiveScene extends MovieClip {

		public var m_scene:MovieClip;
 
		//override public function onReady():void{
		public function onReady():void{
			trace("onReady should be overridden");
		}
		
		public function ResponsiveScene() {
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		

		private function addedToStage(event:Event):void{
			if(!m_scene) return trace("ResponsiveScene.m_scene must be set");
			if(m_scene.padding) m_scene.padding.alpha = 0;
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, resizeHandler);
			onReady();
		}


		function resizeHandler(e:Event):void{
	 		resizeMe(m_scene,stage.stageWidth,stage.stageHeight);
		} 

		//The resizing function
		// parameters
		// required: mc = the movieClip to resize
		// required: maxW = either the size of the box to resize to, or just the maximum desired width
		// optional: maxH = if desired resize area is not a square, the maximum desired height. default is to match to maxW (so if you want to resize to 200x200, just send 200 once)
		// optional: constrainProportions = boolean to determine if you want to constrain proportions or skew image. default true.
		function resizeMe(mc:MovieClip, maxW:Number, maxH:Number=0, constrainProportions:Boolean=true):void{
		    maxH = maxH == 0 ? maxW : maxH;
		    mc.width = maxW;
		    mc.height = maxH;
		    if (constrainProportions) {
		        mc.scaleX < mc.scaleY ? mc.scaleY = mc.scaleX : mc.scaleX = mc.scaleY;
		    }
		    //center the image in the area
		    mc.x = maxW/2 - mc.width/2;
		    mc.y = maxH/2 - mc.height/2;
		}
	}
}
