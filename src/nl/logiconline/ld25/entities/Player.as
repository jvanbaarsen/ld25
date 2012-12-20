/**
 * @project LD25
 * @package nl.logiconline.ld25.entities
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file Player.as
 */
package nl.logiconline.ld25.entities {
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.Ax;
	import org.axgl.AxSprite;
	import org.axgl.AxVector;
	import org.axgl.input.AxKey;

	public class Player extends AxSprite {
		
		public function Player(x:uint = 0, y:uint = 0) {
			super(x, y);
			this.load(Resources.PLAYER, 11, 17);
			
			//Setup physics
			this.maxVelocity = new AxVector(80, 400);
			this.drag = new AxVector(1200, 300);
			this.acceleration.y = 600;
			
			//Setup animations
			this.addAnimation("idle", [0]);
			this.addAnimation("walk", [0,1], 8, true);
			
		}
		
		override public function update():void {
			var left:Boolean = (Ax.keys.down(AxKey.LEFT));
			var right:Boolean = (Ax.keys.down(AxKey.RIGHT));
			
			if(right) {
				this.acceleration.x = 800;				
			} else if(left) {
				this.acceleration.x = -800;				
			} else {
				this.acceleration.x = 0;
			}
			
			if(this.velocity.x < 0) {
				this.facing = LEFT;
			} else if(this.velocity.x > 0) {
				this.facing = RIGHT;
			}
			if(this.velocity.x != 0) {
				this.animate("walk");
			} else {
				this.animate("idle");
			}
			
			super.update();
		}
	}
}