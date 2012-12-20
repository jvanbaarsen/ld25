/**
 * @project LD25
 * @package nl.logiconline.ld25.world
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file WorldBuilder.as
 */
package nl.logiconline.ld25.world {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	
	import flashx.textLayout.elements.BreakElement;
	
	import nl.logiconline.ld25.utils.Globals;
	import nl.logiconline.ld25.world.items.BigPainting;
	import nl.logiconline.ld25.world.items.Door;
	import nl.logiconline.ld25.world.items.Item;
	import nl.logiconline.ld25.world.items.OuterDoor;
	import nl.logiconline.ld25.world.items.SmallPainting;
	import nl.logiconline.ld25.world.items.Tv;
	import nl.logiconline.ld25.world.items.TvTable;
	import nl.logiconline.ld25.world.items.Van;
	import nl.logiconline.ld25.world.items.Vase;
	import nl.logiconline.ld25.world.items.Window;
	
	import org.axgl.AxEntity;
	import org.axgl.AxGroup;
	import org.axgl.AxSprite;

	public class WorldBuilder {
		private var levelFile:Class;
		private var levelPixels:BitmapData;
		private var width:uint, height:uint;
		private var px:uint = 0;
		
		public var worldData:WorldDataTable;
		public var backgroundData:WorldDataTable;		
		
		public function WorldBuilder(levelFile:Class, levelItems:Class, levelBackground:Class = null, levelDetails:Class = null) {
			this.levelFile = levelFile;
			
			//Clear current object stuff
			Globals.reset();			
			
			//Used for calculating the width/height of the map
			this.levelPixels = (new levelFile as Bitmap).bitmapData;
			this.width = this.levelPixels.width;
			this.height = this.levelPixels.height;
			
			//Create our datatables
			this.worldData = new WorldDataTable(this.width, this.height);
			this.backgroundData = new WorldDataTable(this.width, this.height);
			
			//Build our levels			
			this.build(levelFile, worldData);
			this.build(levelBackground, backgroundData);
			
			this.buildDetails(levelDetails);
			this.buildDetails(levelItems);
			
		}
		
		public function build(map:Class, dataTable:WorldDataTable):void {
			if(map == null) return;
			this.levelPixels = (new map as Bitmap).bitmapData;
			for(var x:uint = 0; x < this.width; x++) {
				for(var y:uint = 0; y < this.height; y++) {
					dataTable.setTile(x, y, getTile(x, y));
				}
			}
		}
		
		public function buildDetails(details:Class):void {
			if(details == null)	return;
			this.levelPixels = (new details as Bitmap).bitmapData;
			for(var x:uint = 0; x < this.width; x++) {
				for(var y:uint = 0; y < this.height; y++) {
					createDetail(x, y);		
				}
			}
		}	
		
		public function createDetail(x:uint, y:uint):void {
			var pixel:uint = this.levelPixels.getPixel(x, y);
			switch(pixel) {				
				case Item.OUTER_DOOR:
					Globals.BACKGROUND_DETAILS.add(new OuterDoor((x * Tile.SIZE) - 5, (y * Tile.SIZE) - 5));	
				break;
				case Item.VAN:
					this.createHitbox(x * Tile.SIZE, y * Tile.SIZE, 18, 30);
					Globals.FOREGROUND_DETAILS.add(new Van(x * Tile.SIZE, y * Tile.SIZE));
				break;
				case Item.SMALL_PAINTING:
					Globals.ITEMS.add(new SmallPainting(x * Tile.SIZE, y * Tile.SIZE));
				break;
				case Item.BIG_PAINTING:
					Globals.ITEMS.add(new BigPainting(x * Tile.SIZE, y * Tile.SIZE));
				break;
				case Item.DOOR:
					var door:Door = new Door(x * Tile.SIZE, (y * Tile.SIZE) - 5);
					if(this.levelPixels.getPixel(x, y - 4) == Item.DOOR) {
						door.oppositeDoor = Door.UP;
					} else if(this.levelPixels.getPixel(x, y + 4) == Item.DOOR) {
						door.oppositeDoor = Door.DOWN;
					} else {
						door.oppositeDoor = Door.NONE;
					}
					Globals.BACKGROUND_DETAILS.add(door);
				break;
				case Item.VASE:					
					Globals.ITEMS.add(new Vase(x * Tile.SIZE, (y * Tile.SIZE) - 3));
				break;
				case Item.TV_TABLE:					
					Globals.BACKGROUND_DETAILS.add(new TvTable(x * Tile.SIZE, (y * Tile.SIZE) + 2)); 
				break;
				case Item.TV:					
					Globals.ITEMS.add(new Tv(x * Tile.SIZE, (y * Tile.SIZE) - 4));
				break;
				case Item.WINDOW:
					Globals.BACKGROUND_DETAILS.add(new Window(x * Tile.SIZE, y * Tile.SIZE));
				break;
			}
		}
		
		private function getTile(x:uint, y:uint):uint {
			this.px = this.levelPixels.getPixel(x, y);
			switch(this.px) {
				case Tile.FLOOR:
					this.createHitbox(x * Tile.SIZE, y * Tile.SIZE, Tile.SIZE, Tile.SIZE);
					var d:uint = this.levelPixels.getPixel(x, y+1);					
					if(d == Tile.BEDROCK) {
						return 12;
					} else {
						return 2;
					}					
				break;
				case Tile.FLOOR_STREET:
					this.createHitbox(x * Tile.SIZE, y * Tile.SIZE, Tile.SIZE, Tile.SIZE);
					return 1;
				break;
				case Tile.WALL:
					this.createHitbox(x * Tile.SIZE, y * Tile.SIZE, Tile.SIZE, Tile.SIZE);
					if(this.levelPixels.getPixel(x, y+1) == 0) {
						return 13;
					}
					return 3;
				break;
				case Tile.BEDROCK:
					return 11;
				break;
				case Tile.WHITE_WALLPAPER:
					return 4;
				break;
				case Tile.GREEN_WALLPAPER:
					return 14;
				break;
				case Tile.PINK_WALLPAPER:
					return 15;
				break;
				case Tile.DOORWAY:
					return 5;
				break;				
			}
			return 0;
		}	
		
		private function createHitbox(x:uint, y:uint, width:uint, height:uint):void {
			var hitbox:AxEntity = new AxEntity(x, y);
			hitbox.width = width;
			hitbox.height = height;
			Globals.WORLD_COLLISION.add(hitbox);			
		}
	}
}