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
		
		//{ Region equals
		public function equals(): void
		{
			var t0: Transform = new Transform();
			assertTrue( t0.equals( Transform.IDENTITY ) );
			
			t0.rotate = new HMatrix().rotationX( 23 );
			t0.scale = new APoint( 5, 5, 2 );
			var t1: Transform = new Transform();
			t1.rotate = new HMatrix().rotationX( 23 );
			t1.scale = new APoint( 5, 5, 2 );
			assertTrue( t0.equals( t1 ) );
			
			t0.toIdentity();
			assertFalse( t0.equals( t1 ) );
			
			t1.toIdentity();
			assertTrue( t0.equals( t1 ) );
		}
		//}
		
		//{ Region clone
		public function clone(): void
		{
			var t0: Transform = new Transform();
			
			t0.translate = new APoint( 10, 20, 30 );
			t0.rotate = new HMatrix().rotationY( 10 );
			t0.scale = new APoint( 20, 20, 20 );
			
			var t1: Transform = t0.clone();
			assertTrue( t0.equals( t1 ) );
			
			t0.toUnitScale();
			t1.toUnitScale();
			assertTrue( t0.equals( t1 ) );
			
			t0.toIdentity();
			t1.toIdentity();
			assertTrue( t0.equals( t1 ) );
		}
		//}
		
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
			assertEquals( t0.translate.x, 0 );
			assertEquals( t0.translate.y, 0 );
			assertEquals( t0.translate.z, 0 );
			assertEquals( t0.translate.w, 1 );
			assertEquals( t0.scale.x, 1 );
			assertEquals( t0.scale.y, 1 );
			assertEquals( t0.scale.z, 1 );
			assertEquals( t0.scale.w, 1 );
			assertTrue( t0.rotate.equals( HMatrix.IDENTITY ) );
		}
		//}
		
		//{ Region toUnitScale
		public function toUnitScale(): void
		{
			var t0: Transform = new Transform();
			t0.scale = new APoint( 1, 2, 3 );
			t0.toUnitScale();
			
			assertEquals( t0.scale.x, 1 );
			assertEquals( t0.scale.y, 1 );
			assertEquals( t0.scale.z, 1 );
			assertEquals( t0.scale.w, 1 );
		}
		//}
		
		//{ Region isIdentity
		public function isIdentity(): void
		{
			var t0: Transform = new Transform();
			
			assertTrue( t0.isIdentity );
			
			t0.rotate = new HMatrix().rotationZ( 10 );
			assertFalse( t0.isIdentity );
			
			t0.toIdentity();
			assertTrue( t0.isIdentity );
		}
		//}
		
	}

}