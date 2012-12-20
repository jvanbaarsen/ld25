/**
 * @project LD25
 * @package nl.logiconline.ld25.world
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file World.as
 */
package nl.logiconline.ld25.world {
	import nl.logiconline.ld25.utils.Resources;
	
	import org.axgl.tilemap.AxTilemap;

	public class World extends AxTilemap {
		public function World(dataString:String, tileResources:Class = null) {
			if(tileResources == null) tileResources = Resources.TILES;
			this.build(dataString, tileResources, 10, 10);//XXX Tilesize fixen
		}
	}
}