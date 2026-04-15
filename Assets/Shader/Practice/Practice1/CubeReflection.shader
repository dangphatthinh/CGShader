Shader "Practice/CubeReflection"
{
	Properties
	{
		_mainTex("Main Texture", 2D) = "white" {}
		_bumpMap("Bump Map", 2D) = "bump" {}
		_cubeMap("Cube Map", CUBE) = "" {}
	}
	SubShader
	{
		Tags{"RenderType" = "Opaque"}
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input
		{
			float2 uv_mainTex;
			float2 uv_bumpMap;
			float3 worldRefl; INTERNAL_DATA
		};

		sampler2D _mainTex;
		sampler2D _bumpMap;
		samplerCUBE _cubeMap;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_mainTex, IN.uv_mainTex).rgb;
			o.Normal = UnpackNormal(tex2D(_bumpMap, IN.uv_bumpMap));
			o.Emission = texCUBE(_cubeMap, WorldReflectionVector(IN, o.Normal)).rgb;
		}
		ENDCG
	}
	Fallback "Diffuse"
}