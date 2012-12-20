/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file StealableItem.as
 */
package nl.logiconline.ld25.world.items {
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;

	public class StealableItem extends Item {
		protected var mustShowPrice:Boolean = false;
		public var priceTagOffset:AxPoint = new AxPoint(0,0);
		public var stolen:Boolean = false;
		protected var price:uint = 0;
		public function StealableItem(x:Number, y:Number) {
			super(x, y);
		}
		
		public function getPrice():uint {
			return this.price;
		}
		
		override public function update():void {
			super.update();
			if(this.stolen) {				
				this.frame = 1;
			}
		}
		
	}
}