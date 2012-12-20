/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file SmallPainting.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.LoU;
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.AxPoint;
	import org.axgl.AxU;

	public class SmallPainting extends StealableItem {
		public function SmallPainting(x:Number, y:Number) {
			super(x, y);
			var paintingNr:uint = AxU.rand(1,3);
			if(paintingNr == 1) {
				this.load(Resources.SMALL_PAINTING_1, 10, 10);
			} else if(paintingNr == 2) {
				this.load(Resources.SMALL_PAINTING_2, 10, 10);
			} else {
				this.load(Resources.SMALL_PAINTING_3, 10, 10);	
			}
			
			this.price = AxU.rand(100, 500);			
			this.priceTagOffset = new AxPoint(-12, -10);
		}
	}
}