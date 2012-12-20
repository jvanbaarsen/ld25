/**
 * @project LD25
 * @package nl.logiconline.ld25.utils
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file FlickerText.as
 */
package nl.logiconline.ld25.utils {
	import org.axgl.Ax;
	import org.axgl.text.AxFont;
	import org.axgl.text.AxText;

	public class FlickerText extends AxText {
		private var counter:Number = 0;
		public function FlickerText(x:Number, y:Number, font:AxFont, text:String, width:uint = 0, align:String="left") {
			super(x, y, font, text, width, align);
		}
		
		override public function update():void {
			this.counter += Ax.dt	
			
			if(this.counter > 0.5) {
				this.visible = false;				
			} else {
				this.visible = true;
			}
			
			if(this.counter > 1) {
				this.counter = 0;
			}
			
		}
	}
}