/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file Window.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.Resources;

	public class Window extends Item {
		public function Window(x:Number, y:Number) {
			super(x, y);
			this.load(Resources.WINDOW);
		}
	}
}