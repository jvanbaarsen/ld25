/**
 * @project LD25
 * @package nl.logiconline.ld25.world
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file PriceTag.as
 */
package nl.logiconline.ld25.world {
	import nl.logiconline.ld25.utils.Resources;
	import nl.logiconline.ld25.utils.SmallText;
	
	import org.axgl.AxGroup;
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	import org.axgl.render.AxColor;
	import org.axgl.text.AxText;

	public class PriceTag extends AxGroup {
		public var sprite:AxSprite;
		public var text:AxText;
		
		public function PriceTag() {
			this.sprite = new AxSprite(0, 0, Resources.PRICETAG);
			this.text = new AxText(0,0,null, "$ 000000", 32, "center");
			this.text.scale = new AxPoint(0.5, 0.5);			
			this.text.align = "left";					
			
			this.add(this.sprite);
			this.add(this.text);
		}		
	}
}