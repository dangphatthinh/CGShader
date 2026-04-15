Shader "MyShader/MyfirstSurfaceShader"
{
	Properties
	{
		_myDiffuse("Base Color", Color) = (1, 1, 1, 1)
		_myEmission("Emission Color", Color) = (1, 1, 1, 1)
	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert
		
		fixed4 _myDiffuse;
		fixed4 _myEmission;

		struct Input
		{
			float2 uv_Maintexture;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = _myDiffuse.rgb;
			o.Emission = _myEmission.rgb;
		}

		ENDCG
	}
	Fallback "Diffuse"
}