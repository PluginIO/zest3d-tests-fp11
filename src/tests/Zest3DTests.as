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
			
			// zest3d.datatypes.Transform
			addTest( new TransformTestCase( "equals" ) );
			addTest( new TransformTestCase( "clone" ) );
			addTest( new TransformTestCase( "toIdentity" ) );
			addTest( new TransformTestCase( "toUnitScale" ) );
			addTest( new TransformTestCase( "isIdentity" ) );
		}
		
	}

}