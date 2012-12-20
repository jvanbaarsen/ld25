/**
 * @project LD25
 * @package nl.logiconline.ld25.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file TitleState.as
 */
package nl.logiconline.ld25.states {
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.Ax;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.input.AxKey;

	public class TitleState extends AxState {
		public function TitleState() {
			var bg:AxSprite = new AxSprite(0,0, Resources.SPLASH);
			add(bg);
		}
		
		override public function update():void {
			super.update();
			if(Ax.keys.pressed(AxKey.SPACE)) {
				Ax.switchState(new GameState);
			}
		}
	}
}