/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file Vase.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.AxPoint;
	import org.axgl.AxU;

	public class Vase extends StealableItem {
		public function Vase(x:Number, y:Number) {
			super(x, y);			
			this.load(Resources.VASE, 10, 13);
			this.price = AxU.rand(200, 400);
			
			this.priceTagOffset = new AxPoint(-10, -10);
			
		}
	}
}