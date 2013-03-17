package tests 
{
	import asunit.framework.TestSuite;
	import tests.zest3d.datatypes.TransformTestCase;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class Zest3DTests extends TestSuite 
	{
		
		public function Zest3DTests() 
		{
			super();
			
			addTest( new TransformTestCase( "toIdentity" ) );
		}
		
	}

}