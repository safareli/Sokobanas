package  {
	import flash.display.MovieClip;
	
	public class tiles_mc extends MovieClip {
		private var main:Main;
		private var curRow:uint;
		private var curCol:uint;
		public function tiles_mc(type:uint,row:uint,col:uint) {
			switch( type )
			{
				case Main.TILE: 	gotoAndStop(2); break;
				case Main.PLANT1: 	gotoAndStop(3); break;
				case Main.PLANT2: 	gotoAndStop(4); break;
				case Main.TARGET: 	gotoAndStop(5); break;
				default:			gotoAndStop(1); break;
			}
			x=col*76;
			y=row*76;
		}

	}
	
}
