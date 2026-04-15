Shader "Practice/Detailtexture"
{
	Properties
	{
		_mainTex("Main Texture", 2D) = "white" {}
		_bumpMap("Bump Map", 2D) = "bump" {}
		_detailTex("Detail Texture", 2D) = "grey" {}
	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input
		{
			float2 uv_mainTex;
			float2 uv_bumpMap;
			float2 uv_detailTex;
		};

		sampler2D _mainTex;
		sampler2D _bumpMap;
		sampler2D _detailTex;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_mainTex, IN.uv_mainTex).rgb;
			o.Albedo *= tex2D(_detailTex, IN.uv_detailTex).rgb*2;
			o.Normal = UnpackNormal(tex2D(_bumpMap, IN.uv_bumpMap));
		}
		ENDCG
	}
	Fallback "Diffuse"
}