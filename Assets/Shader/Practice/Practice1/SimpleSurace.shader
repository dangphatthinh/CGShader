Shader "Practice/SimpleSurface"
{
	Properties
	{
		_myColor("Color", Color) = (1, 1, 1, 1)
	}
	SubShader
	{
		Tags{"RenderType" = "Opaque"}
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input
		{
			float4 color: COLOR;
		};

		fixed4 _myColor;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = _myColor.rgb;
		}
		ENDCG
	}
	Fallback "Diffuse"
}