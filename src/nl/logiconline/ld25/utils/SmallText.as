/**
 * @project LD25
 * @package nl.logiconline.ld25.utils
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file SmallText.as
 */
package nl.logiconline.ld25.utils {
	import org.axgl.text.AxFont;
	import org.axgl.text.AxText;

	public class SmallText extends AxText {
		public function SmallText(x:Number, y:Number, font:AxFont, text:String, width:uint = 0, align:String="left") {
			super(x, y, font, text, width, align);
			this.zooms = false;
		}
	}
}