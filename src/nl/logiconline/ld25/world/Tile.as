/**
 * @project LD25
 * @package nl.logiconline.ld25.world
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file Tile.as
 */
package nl.logiconline.ld25.world {
	public class Tile {
		public static const SIZE:uint = 10;
		
		public static const WALL:uint = 0xff0000;
		
		public static const FLOOR:uint = 0x00ff00;
		public static const FLOOR_STREET:uint = 0x197b30;
		
		public static const BEDROCK:uint = 0xd7d7d7;
		
		
		//background tiles
		public static const WHITE_WALLPAPER:uint = 0x00aeef;
		public static const GREEN_WALLPAPER:uint = 0x82ca9c;
		public static const PINK_WALLPAPER:uint = 0xf5c4c6;
		public static const DOORWAY:uint = 0x0072bc;
		
				
	}
}