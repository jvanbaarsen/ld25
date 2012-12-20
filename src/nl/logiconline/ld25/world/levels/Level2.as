/**
 * @project LD25
 * @package nl.logiconline.ld25.world.levels
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 16, 2012
 * @file Level2.as
 */
package nl.logiconline.ld25.world.levels {
	import nl.logiconline.ld25.utils.Resources;
	import nl.logiconline.ld25.world.WorldBuilder;

	public class Level2 extends Level {
		public function Level2() {
			this.targetScore = 6000;
			this.levelNumber = 2;
			this.timeToComplete = 40;
		}
		
		override public function getWorldBuilder():WorldBuilder {
			return new WorldBuilder(Resources.LEVEL_2, Resources.LEVEL_2_ITEMS, Resources.LEVEL_2_BACKGROUND, Resources.LEVEL_2_DETAILS);
		}
	}
}