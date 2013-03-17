package tests.zest3d.datatypes 
{
	import asunit.framework.TestCase;
	import io.plugin.math.algebra.APoint;
	import io.plugin.math.algebra.HMatrix;
	import io.plugin.math.base.MathHelper;
	import zest3d.datatypes.Transform;
	
	/**
	 * ...
	 * @author Gary Paluk
	 */
	public class TransformTestCase extends TestCase 
	{
		
		public function TransformTestCase( testMethod: String ) 
		{
			super( testMethod );
		}
		
		//{ Region toIdentity
		public function toIdentity(): void
		{
			var t0: Transform = new Transform();
			t0.translate = new APoint( 1, 2, 3 );
			t0.rotate = new HMatrix().rotationX( 15 * MathHelper.DEG_TO_RAD );
			t0.scale = new APoint( 5, 1, 3 );
			
			t0.toIdentity();
			
			assertTrue( t0.isIdentity );
			assertTrue( t0.isRSMatrix );
			assertTrue( t0.isUniformScale );
		}
		
	}

}