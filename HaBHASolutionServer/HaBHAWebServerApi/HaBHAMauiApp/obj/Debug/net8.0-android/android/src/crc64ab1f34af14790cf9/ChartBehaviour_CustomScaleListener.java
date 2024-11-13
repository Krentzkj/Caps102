package crc64ab1f34af14790cf9;


public class ChartBehaviour_CustomScaleListener
	extends android.view.ScaleGestureDetector.SimpleOnScaleGestureListener
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onScale:(Landroid/view/ScaleGestureDetector;)Z:GetOnScale_Landroid_view_ScaleGestureDetector_Handler\n" +
			"";
		mono.android.Runtime.register ("LiveChartsCore.Behaviours.ChartBehaviour+CustomScaleListener, LiveChartsCore.Behaviours", ChartBehaviour_CustomScaleListener.class, __md_methods);
	}


	public ChartBehaviour_CustomScaleListener ()
	{
		super ();
		if (getClass () == ChartBehaviour_CustomScaleListener.class) {
			mono.android.TypeManager.Activate ("LiveChartsCore.Behaviours.ChartBehaviour+CustomScaleListener, LiveChartsCore.Behaviours", "", this, new java.lang.Object[] {  });
		}
	}


	public boolean onScale (android.view.ScaleGestureDetector p0)
	{
		return n_onScale (p0);
	}

	private native boolean n_onScale (android.view.ScaleGestureDetector p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
