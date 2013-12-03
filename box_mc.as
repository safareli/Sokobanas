package  {
	import flash.display.MovieClip;
	import com.greensock.*; 
	import com.greensock.easing.*;
	
	public class box_mc extends MovieClip {

		private var curRow:uint;
		private var curCol:uint;
		public function box_mc(type:uint,row:uint,col:uint) {
			curRow = row;
			curCol = col;
			x=curCol*76;
			y=curRow*76;
			set(type);
		}
		private function set(type:uint):void{
			name=curRow+"_"+curCol;
			if(type & Main.TARGET)
				gotoAndStop(1);
			else
				gotoAndStop(2);
		}

		public function move(type:uint,row:int,col:int):void {
			curRow+=row;
			curCol+=col;
			TweenMax.to(this, Main.MOVE_DURATION, {y:curRow*76,x:curCol*76,onComplete:set,onCompleteParams:[type], ease:Linear.easeIn});
		}
 

	}
}
