/**
 * @project LD25
 * @package nl.logiconline.ld25.world
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file WorldDataTable.as
 */
package nl.logiconline.ld25.world {
	public class WorldDataTable {
		private var data:Vector.<Vector.<uint>>;
		private var width:uint, height:uint;
		private var empty:Boolean = true;
		public function WorldDataTable(width:uint, height:uint) {
			this.width = width;
			this.height = height;
			this.data = new Vector.<Vector.<uint>>(height);
			for(var y:uint = 0; y < height; y++) {
				this.data[y] = new Vector.<uint>(width);
			}
		}
		
		public function setTile(x:uint, y:uint, tile:uint):void {
			if(x < 0 || y < 0) return;
			if(tile != 0) empty = false;
			this.data[y][x] = tile;
		}
		
		public function getTile(x:uint, y:uint):uint {
			if(x < 0 || y < 0 || x >= this.width || y >= this.height) return 0;
			return this.data[x][y];
		}
		
		public function getData():String {
			if(empty) return "20";
			var cols:Array = [];
			for(var y:uint = 0; y < this.data.length; y++) {
				cols.push(this.data[y].join(","));
			}
			return cols.join("\n");
		}
		
		
	}
}