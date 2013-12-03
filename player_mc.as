package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*; 
	import com.greensock.easing.*;

	public class player_mc extends MovieClip {
		private var main:Main;
		private var curRow:uint;
		private var curCol:uint;
		private var dirRow:int;
		private var dirCol:int;
		private var isBox:Boolean;
		private var tween:TweenMax;
		public function player_mc(_main:Main,row:uint,col:uint) {
			gotoAndStop(2);
			main = _main;
			curRow = row;
			curCol = col;
			x=col*76;
			y=row*76;
			isBox = false;
			// addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		private function onTweeUpdate() {
			if(isBox) return;
			var add:uint = Math.ceil(tween.currentProgress * 4)%2+1;
			setframePosition(dirRow,dirCol,add);
		}
		private function onTweeComplete() {
			setframePosition(dirRow,dirCol,-int(isBox));
			main.checkSolved();
		}
		private function setframePosition(row:int,col:int,extra :int) {
			gotoAndStop(((-1*col+2)*4+2+extra)*Math.abs(col) + ((row + 1 )*4+2+extra)*Math.abs(row));
		}
		public function moveBy(level:uint,row:int,col:int):void {
			if(TweenMax.isTweening(this)) return;
			var isWalkable1:Boolean = main.isWalkable(curRow+row,curCol+col);
			var isWalkable2:Boolean = main.isWalkable(curRow+2*row,curCol+2*col);
			isBox =  main.isBox(curRow+row,curCol+col);
			if (isWalkable1) {
				move(level,row,col);
			} else if (isWalkable2 && isBox) {
				move(level,row,col);
			}

			setframePosition(row,col,-int(isBox));
		}

		public function move(level:uint,row:int,col:int):void {
			if(isBox){
				main.moveBox(curRow+row,curCol+col,row,col);
			}
			main.movePlayer(curRow,curCol,row,col);
			curRow+=row;
			curCol+=col;
			dirRow=row;
			dirCol=col;

			tween = new TweenMax(this, Main.MOVE_DURATION, {y:curRow*76,x:curCol*76,onUpdate:onTweeUpdate,onComplete:onTweeComplete, ease:Linear.easeIn});
		}
 

	}
	
}
