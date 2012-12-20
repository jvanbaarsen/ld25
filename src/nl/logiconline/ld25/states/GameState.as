/**
 * @project LD25
 * @package nl.logiconline.ld25.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Dec 15, 2012
 * @file GameState.as
 */
package nl.logiconline.ld25.states {
	import nl.logiconline.ld25.entities.Player;
	import nl.logiconline.ld25.utils.FloatingText;
	import nl.logiconline.ld25.utils.Globals;
	import nl.logiconline.ld25.utils.Resources;
	import nl.logiconline.ld25.utils.SmallText;
	import nl.logiconline.ld25.world.PriceTag;
	import nl.logiconline.ld25.world.Tile;
	import nl.logiconline.ld25.world.World;
	import nl.logiconline.ld25.world.WorldBuilder;
	import nl.logiconline.ld25.world.items.Door;
	import nl.logiconline.ld25.world.items.Item;
	import nl.logiconline.ld25.world.items.OuterDoor;
	import nl.logiconline.ld25.world.items.StealableItem;
	import nl.logiconline.ld25.world.items.Van;
	
	import org.axgl.Ax;
	import org.axgl.AxPoint;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxState;
	import org.axgl.input.AxKey;
	import org.axgl.sound.AxMusic;
	import org.axgl.sound.AxSound;
	import org.axgl.text.AxFont;
	import org.axgl.text.AxText;
	

	public class GameState extends AxState {
		private var world:World;
		private var player:Player;	
		private var targetScore:AxText;
		private var currentScore:AxText;
		private var timeLeft:AxText;
		private var timePassed:Number = 0;
		private var priceTag:PriceTag = new PriceTag();
		
		private var inFrontOfDoor:Door = null;
		private var inFrontOfItem:StealableItem = null;
		private var inFrontOfVan:Boolean = true;
		
		private var doorOpenSound:AxSound;
		private var cashSound:AxSound;
		private var frontDoorOpen:Boolean = false;
		
		private var inventory:StealableItem = null;
		override public function create():void {
			super.create();		
			Globals.currentLevel.resetLevel();
			
			var background:AxSprite = new AxSprite(0,0, Resources.BACKGROUND);
			background.scroll = new AxPoint(0,0);
			this.add(background);
			
			this.doorOpenSound = new AxSound(Resources.DOOR_OPEN, 0.3);
			this.cashSound = new AxSound(Resources.CASH, 0.3);
			var music:AxMusic = new AxMusic(Resources.MUSIC,1);
			music.play();
			
			//Create our world
			var worldBuilder:WorldBuilder = Globals.currentLevel.getWorldBuilder();		
			this.add(new World(worldBuilder.backgroundData.getData()));						
			this.world = new World(worldBuilder.worldData.getData());
			this.add(world);
			
			this.add(Globals.BACKGROUND_DETAILS);
			this.add(Globals.ITEMS);
			
			this.player = new Player(1 * Tile.SIZE,12 * Tile.SIZE);
			this.add(player);
			
			this.add(Globals.FOREGROUND_DETAILS);
			
			
			Ax.camera.follow(player);
			player.worldBounds = new AxRect(0,0, world.width, world.height);
			Ax.camera.bounds = new AxRect(0,0, world.width, world.height);
			
			var hud:AxSprite = new AxSprite(0,139, Resources.HUD);
			hud.scroll = new AxPoint(0,0);
			this.add(hud);
			
			
			var text:SmallText = new SmallText(16, 285, null, "TARGET SCORE", 128, "center");
			text.scroll = new AxPoint(0,0);			
			this.add(text);
			
			targetScore = new SmallText(16, 297, null, "$ "+ Globals.currentLevel.getTargetScore(), 128, "center");
			targetScore.scroll = new AxPoint(0,0);
			this.add(targetScore);
			
			text = new SmallText(178, 285, null, "CURRENT SCORE", 128, "center");
			text.scroll = new AxPoint(0,0);
			this.add(text);
			
			currentScore = new SmallText(178, 297, null, "$ "+ Globals.currentScore, 128, "center");
			currentScore.scroll = new AxPoint(0,0);
			this.add(currentScore);			
						
			text = new SmallText(340, 285, null, "TIME LEFT", 128, "center");						
			text.scroll = new AxPoint(0,0);
			this.add(text);			
			
			timeLeft = new SmallText(340, 297, null, Globals.currentLevel.getTimeToComplete().toString(), 128, "center");
			timeLeft.scroll = new AxPoint(0,0);
			this.add(timeLeft);
			
			this.add(this.priceTag);
			
			
		}
		
		override public function update():void {
			this.priceTag.visible = false;
			this.inFrontOfDoor = null;
			this.inFrontOfItem = null;
			this.inFrontOfVan = false;
			super.update();			
			
			Ax.collide(player, Globals.WORLD_COLLISION);
			Ax.overlap(player, Globals.BACKGROUND_DETAILS, detailOverlap);
			Ax.overlap(player, Globals.FOREGROUND_DETAILS, detailOverlap);
			Ax.overlap(player, Globals.ITEMS, itemOverlap)
			
			Globals.timePassed += Ax.dt;
			this.timeLeft.text = (Globals.currentLevel.getTimeToComplete() - Math.round(Globals.timePassed)).toString();			
			if(this.timeLeft.text == "0") {
				Ax.pushState(new TimeUpState);
			}			
			this.currentScore.text = "$ "+ Globals.currentScore;
			
			if(Ax.keys.pressed(AxKey.UP) && this.inFrontOfDoor != null) {
				if(this.inFrontOfDoor.oppositeDoor == Door.UP) {
					this.player.y = this.inFrontOfDoor.y - ((4 * Tile.SIZE) - 4);
					this.doorOpenSound.play();
				} else if(this.inFrontOfDoor.oppositeDoor == Door.DOWN) {
					this.player.y = this.inFrontOfDoor.y + ((4 * Tile.SIZE) + 5);
					this.doorOpenSound.play();
				}				
			}
			
			if(Ax.keys.pressed(AxKey.SPACE) && this.inFrontOfItem != null) {
				if(this.inventory != null) {
					add(new FloatingText(Ax.camera.x, Ax.camera.y + 100, null, "@[0,0,0]Your inventory is not empty. Put the stuff in the truck first!",true, 240, "center"));
				} else {
					this.inFrontOfItem.stolen = true;
					this.inventory = this.inFrontOfItem;
				}								
			} else if(Ax.keys.pressed(AxKey.SPACE) && this.inFrontOfVan) {
				if(this.inventory == null) {				
					add(new FloatingText(Ax.camera.x,Ax.camera.y + 100, null, "@[0,0,0]Your inventory is empty, go steal some stuff!", true, 240, "center"));		
				} else {
					add(new FloatingText(Ax.camera.x,Ax.camera.y + 100, null, "@[0,0,0]+ $ "+ this.inventory.getPrice().toString(), true, 240, "center"));
					Globals.currentScore += this.inventory.getPrice();
					this.inventory = null;				
					this.cashSound.play();
				}
			}			
		}
		
		public function itemOverlap(player:Player, item:StealableItem):void {
			if(item.stolen) return;
			this.priceTag.visible = true;				
			this.priceTag.sprite.y = item.y + item.priceTagOffset.y;
			this.priceTag.sprite.x = item.x + item.priceTagOffset.x;
			this.priceTag.text.x = item.x + item.priceTagOffset.x;
			this.priceTag.text.y = item.y + item.priceTagOffset.y + 2;
			this.priceTag.text.text = item.getPrice().toString();
			
			this.priceTag.text.width = 32;
			this.priceTag.text.align = "center";
			this.inFrontOfItem = item;
		}
		
		public function detailOverlap(player:Player, detail:Item):void {
			if(detail is OuterDoor) {
				OuterDoor(detail).openDoor();	
				if(!frontDoorOpen) {
					this.doorOpenSound.play();
					frontDoorOpen = true;
				}
			} else if(detail is Door) {				
				this.inFrontOfDoor = Door(detail);			
			} else if(detail is Van) {				
				this.inFrontOfVan = true;				
			}
			
		}
	}
}