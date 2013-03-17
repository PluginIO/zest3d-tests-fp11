package tests 
{
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	import flash.events.Event;
	import tests.Zest3DTests;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var unitTests: TestRunner = new TestRunner();
			stage.addChild( unitTests );
			unitTests.start( Zest3DTests, null, TestRunner.SHOW_TRACE );
			
		}
		
	}

}