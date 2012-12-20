/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file Item.as
 */
package nl.logiconline.ld25.world.items {
	import org.axgl.AxSprite;

	public class Item extends AxSprite {		
		
		//(semi) static items
		public static const DOOR:uint = 0xfff200;
		public static const OUTER_DOOR:uint = 0x603913;
		public static const VAN:uint = 0x440e62;
		public static const TV_TABLE:uint = 0x197b30;
		public static const WINDOW:uint = 0x2e3192;
		
		//Stealable items
		public static const SMALL_PAINTING:uint = 0xf49ac1;
		public static const BIG_PAINTING:uint = 0xbd8cbf;
		public static const VASE:uint = 0xec008c;
		public static const TV:uint = 0xf26522;
		
		public function Item(x:Number, y:Number) {
			super(x,y);
		}
	}
}