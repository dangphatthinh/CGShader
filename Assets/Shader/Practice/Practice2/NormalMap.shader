Shader "Practice2/NormalMap"
{
	Properties
	{
		_myDiffuse("Diffuse Texture", 2D) = "white" {}
		_myBump("Bump Texture", 2D) = "white" {}
		_myCube("Cube Map", CUBE) = "" {}
		_myBright("Brightness", Range(0, 10)) = 1
		_myBumpPower("Bump Amount", Range(0, 10)) = 1
	}
	SubShader
	{
		Tags{"Queue" = "Geometry"}

		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _myDiffuse;
		sampler2D _myBump;
		samplerCUBE _myCube;
		half _myBright;
		half _myBumpPower;

		struct Input
		{
			float2 uv_myDiffuse;
			float2 uv_myBump;
			float3 worldRefl; INTERNAL_DATA
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb;
			o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
			o.Normal *= float3(_myBumpPower, _myBumpPower, 1);
			o.Emission = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
		}
		ENDCG
	}
	Fallback "Diffuse"
}