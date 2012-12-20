/**
 * @project LD25
 * @package 
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file main.as
 */
package {
	import nl.logiconline.ld25.states.GameState;
	import nl.logiconline.ld25.states.TitleState;
	
	import org.axgl.Ax;
	import org.axgl.collision.AxCollider;
	import org.axgl.render.AxColor;
	
	[SWF(width="480", height="320", backgroundColor="#000000")]
	[Frame(factoryClass = "PreLoader")]
	public class main extends Ax {
		public function main() {
			super(TitleState, 480, 320, 2);
			Ax.background = AxColor.fromHex(0x000000);
		}
	}
}