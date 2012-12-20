/**
 * @project LD25
 * @package nl.logiconline.ld25.world.levels
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file Level.as
 */
package nl.logiconline.ld25.world.levels {
	import nl.logiconline.ld25.utils.Globals;
	import nl.logiconline.ld25.world.WorldBuilder;

	public class Level {
		protected var targetScore:uint = 1000;
		protected var timeToComplete:uint = 0;	
		protected var levelNumber:uint = 1;		
		
		public function getTargetScore():uint {
			return this.targetScore;
		}
		
		public function getTimeToComplete():uint {
			return this.timeToComplete;
		}
		
		public function getLevelNumber():uint {
			return levelNumber;
		}
		
		public function resetLevel():void {
			//Override
			Globals.currentScore = 0;
			Globals.timePassed = 0;
		}
		
		public function getWorldBuilder():WorldBuilder {
			//OVERRIDE
			return null;
		}
	}
}