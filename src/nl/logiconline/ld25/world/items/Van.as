/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file Van.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.Resources;

	public class Van extends Item {
		public function Van(x:Number, y:Number) {
			super(x, y);
			this.load(Resources.VAN);
		}
	}
}