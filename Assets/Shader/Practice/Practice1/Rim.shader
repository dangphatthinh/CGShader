Shader "Practice/Rim"
{
	Properties
	{
		_myTex("Diffuse Texture", 2D) = "white" {}
		_myBump("Bump Map", 2D) = "bump" {}
		_myColor("Rim Color", Color) = (1, 1, 1, 1)
		_rimPow("Rim Power", Range(0, 5)) = 1
	}
	SubShader
	{
		Tags {"RenderType" = "Opaque"}
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input
		{
			float2 uv_myTex;
			float2 uv_myBump;
			float3 viewDir;
		};

		sampler2D _myTex;
		sampler2D _myBump;
		fixed4 _myColor;
		half _rimPow;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_myTex, IN.uv_myTex).rgb;
			o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
			half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = _myColor.rgb * pow(rim, _rimPow);
		}
		ENDCG
	}
	Fallback "Diffuse"
}