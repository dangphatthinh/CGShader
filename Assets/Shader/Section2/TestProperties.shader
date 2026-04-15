Shader "MyShader/TestProperties"
{
	Properties
	{
		_myColor ("Exmample Color", Color) = (1, 1, 1 ,1)
		_myEmission("Example Emission", Color) = (1, 1, 1, 1)
		_myRange ("Example Range", Range(0, 5)) = 1
		_myTex ("Example Texture", 2D) = "white" {}
		_myCube ("Example Cube", CUBE) = "" {}
		_myFloat ("Example Float", Float) = 0.5
		_myVector("Example Vector", Vector) = (1, 1, 1, 1)
	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input
		{
			float2 uv_myTex;
			float3 worldRefl;
		};

		fixed4 _myColor;
		fixed4 _myEmission;
		half _myRange;
		sampler2D _myTex;
		samplerCUBE _myCube;
		float _myFloat;
		float4 _myVector;

		void surf (Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_myTex, IN.uv_myTex).rgb;
			o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}