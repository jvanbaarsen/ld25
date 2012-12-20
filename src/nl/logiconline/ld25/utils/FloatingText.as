/**
 * @project LD25
 * @package nl.logiconline.ld25.utils
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file FloatingText.as
 */
package nl.logiconline.ld25.utils {
	import org.axgl.text.AxFont;
	import org.axgl.text.AxText;

	public class FloatingText extends AxText {
		public function FloatingText(x:Number, y:Number, font:AxFont, text: String,zoom:Boolean = false, width:uint = 0, align:String="left") {
			super(x, y, font, text, width, align);
			this.zooms = zoom;
		}
		
		override public function update():void {
			super.update();
			this.y -= 0.3;
			this.alpha -= 0.008;
			if(this.alpha < 0) this.destroy();
		}
	}
}