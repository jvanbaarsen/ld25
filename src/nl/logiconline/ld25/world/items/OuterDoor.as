/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file OuterDoor.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.Resources;

	public class OuterDoor extends Item {
		private var isOpen:Boolean = false;
		public function OuterDoor(x:Number, y:Number) {
			super(x, y);
			this.load(Resources.OUTSIDE_DOOR, 20, 25);
			this.bounds(10,20, 0, 0);
		}
		
		override public function update():void {
			super.update();
			if(this.isOpen) frame = 1;
		}
		
		public function openDoor():void {
			this.isOpen = true;	
		}
	}
}