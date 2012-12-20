/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file BigPainting.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.LoU;
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.AxPoint;
	import org.axgl.AxU;

	public class BigPainting extends StealableItem {
		public function BigPainting(x:Number, y:Number) {
			super(x, y);
			this.load(Resources.BIG_PAINTING, 20, 10);			
			this.price = AxU.rand(300, 1000);
			this.priceTagOffset = new AxPoint(-5, -10);
		}
	}
}