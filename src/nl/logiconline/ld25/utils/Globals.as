/**
 * @project LD25
 * @package nl.logiconline.ld25.utils
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file Globals.as
 */
package nl.logiconline.ld25.utils {
	import nl.logiconline.ld25.world.levels.Level;
	import nl.logiconline.ld25.world.levels.Level1;
	import nl.logiconline.ld25.world.levels.Level2;
	
	import org.axgl.AxGroup;
	import org.axgl.collision.AxGrid;

	public class Globals {
		
		public static const TOTAL_LEVELS:uint = 2;
		
		public static var WORLD_COLLISION:AxGroup = new AxGroup();
		
		public static var BACKGROUND_DETAILS:AxGroup = new AxGroup(); //Details the player will be in front of
		public static var FOREGROUND_DETAILS:AxGroup = new AxGroup(); //Details the player will be in de background of (i.e you wont see the player)
		public static var ITEMS:AxGroup = new AxGroup();
		
		public static var currentLevel:Level = new Level1(); //XXX Create more levels?
		
		public static var currentScore:uint = 0;
		public static var timePassed:Number = 0;
		
		public static function reset():void {
			Globals.BACKGROUND_DETAILS = new AxGroup();
			Globals.FOREGROUND_DETAILS = new AxGroup();
			Globals.WORLD_COLLISION = new AxGroup();
			Globals.ITEMS = new AxGroup();
		}
	}
}