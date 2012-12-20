/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file Door.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.Resources;

	public class Door extends Item {
		public static const DOWN:uint = 0;
		public static const UP:uint = 1;
		public static const NONE:uint = 2;
		public var oppositeDoor:uint = Door.NONE;
		public function Door(x:Number, y:Number) {
			super(x, y);
			this.load(Resources.DOOR);
		}
	}
}