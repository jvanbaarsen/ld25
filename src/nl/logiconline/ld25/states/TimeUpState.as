/**
 * @project LD25
 * @package nl.logiconline.ld25.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file TimeUpState.as
 */
package nl.logiconline.ld25.states {
	import nl.logiconline.ld25.utils.FlickerText;
	import nl.logiconline.ld25.utils.Globals;
	import nl.logiconline.ld25.utils.Resources;
	import nl.logiconline.ld25.world.levels.Level;
	import nl.logiconline.ld25.world.levels.Level1;
	import nl.logiconline.ld25.world.levels.Level2;
	
	import org.axgl.Ax;
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.input.AxKey;
	import org.axgl.text.AxText;

	public class TimeUpState extends AxState {
		private var status:uint = 0;
		public function TimeUpState() {
			
			var background:AxSprite = new AxSprite(0,0, Resources.TIMEUP_BACKGROUNG);
			background.scroll = new AxPoint(0,0);
			add(background);			
			
			var timeup:AxText = new AxText(0,60,null, "Time is up!", 240, "center");
			timeup.scroll = new AxPoint(0,0);
			add(timeup);
			var statusText:AxText;
			var action:FlickerText;
			if(Globals.currentScore >= Globals.currentLevel.getTargetScore()) {				
				statusText = new AxText( 0, 90, null, "You made it!", 240, "center");
				statusText.scroll = new AxPoint(0,0);
				add(statusText);
				if(Globals.TOTAL_LEVELS == Globals.currentLevel.getLevelNumber()) {
					action = new FlickerText(0, 120, null, "You cleared all the levels!", 240, "center");
					action.scroll = new AxPoint(0,0);						
					add(action);
				} else {
					action = new FlickerText(0, 120, null, "Press SPACE for next level", 240, "center");
					action.scroll = new AxPoint(0,0);
					add(action);
					status = 1;
				}
			} else {
				statusText = new AxText( 0, 90, null, "You failed! You are a bad thief! BAD I SAY!", 240, "center");
				statusText.scroll = new AxPoint(0,0);
				add(statusText);
				
				action = new FlickerText(0, 120, null, "Press SPACE to try again", 240, "center");
				action.scroll = new AxPoint(0,0);
				add(action);
				status = 2;
			}			
			
		}
		
		override public function update():void {
			super.update();
			if(status == 1 && Ax.keys.pressed(AxKey.SPACE)) {
				if(Globals.currentLevel is Level1) {
					Globals.currentLevel = new Level2();
				}
				Ax.switchState(new GameState);
								
			} else if(status == 2 && Ax.keys.pressed(AxKey.SPACE)) {
				Ax.switchState(new GameState);		
			} else if(Ax.keys.pressed(AxKey.SPACE)) {
				Globals.currentLevel = new Level1();
				Ax.switchState(new GameState);
			}
		}
	}
}