Shader "Practice/NormalMapping"
{
	Properties
	{
		_myTex("Main Texture", 2D) = "white" {}
		_myNor("Normal Map", 2D) = "bump" {}
	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input
		{
			float2 uv_myTex;
			float2 uv_myNor;
		};

		sampler2D _myTex;
		sampler2D _myNor;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_myTex, IN.uv_myTex).rgb;
			o.Normal = UnpackNormal (tex2D(_myNor, IN.uv_myNor));
		}
		ENDCG
	}
	Fallback "Diffuse"
}