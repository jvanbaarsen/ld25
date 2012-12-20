/**
 * @project LD25
 * @package nl.logiconline.ld25.world.items
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file TvTable.as
 */
package nl.logiconline.ld25.world.items {
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.AxPoint;

	public class TvTable extends Item {
		public function TvTable(x:Number, y:Number) {
			super(x, y);
			this.load(Resources.TV_TABLE);		
			
		}
	}
}