/**
 * @project LD25
 * @package nl.logiconline.ld25.world.levels
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file Level1.as
 */
package nl.logiconline.ld25.world.levels {
	import nl.logiconline.ld25.utils.Resources;
	import nl.logiconline.ld25.world.WorldBuilder;

	public class Level1 extends Level {
		public function Level1() {
			this.targetScore = 3000;
			this.levelNumber = 1;
			this.timeToComplete = 20;
		}
		
		override public function getWorldBuilder():WorldBuilder {			
			return new WorldBuilder(Resources.LEVEL_1, Resources.LEVEL_1_ITEMS, Resources.LEVEL_1_BACKGROUND, Resources.LEVEL_1_DETAILS);
		}
	}
}