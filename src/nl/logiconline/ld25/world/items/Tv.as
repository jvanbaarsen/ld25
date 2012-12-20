/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file Tv.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.Ax;
	import org.axgl.AxPoint;
	import org.axgl.AxU;

	public class Tv extends StealableItem {
		public function Tv(x:Number, y:Number) {
			super(x, y);
			this.load(Resources.TV, 20, 16);			
			this.price = AxU.rand(1000, 5000);			
			this.priceTagOffset = new AxPoint(-6, -10);
			
		}
	}
}