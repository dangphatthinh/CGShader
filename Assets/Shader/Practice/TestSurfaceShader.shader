Shader "MyShader/TestSurfaceShader"
{
	Properties
	{
		_MainTexture("Main Texture", 2D) = "white" {}
		_Color("Base Color", Color) = (1, 1, 1, 1)
		_EmissionColor("Emission Color", Color) = (1, 1, 1, 1)
		_myCube("CUBE map", CUBE) = "white" {}
		[Toggle(ENABLE_EMISSION)] _isEmissive("Is emissive", Float) = 0
		[Toggle(ENABLE_COLOR)] _isUsingBaseColor("Is using base color", Float) = 0
	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert
		#pragma shader_feature ENABLE_EMISSION
		#pragma shader_feature ENABLE_COLOR

		sampler2D _MainTexture;
		fixed4 _Color;
		fixed4 _EmissionColor;
		samplerCUBE _myCube;

		struct Input
		{
			float2 uv_MainTexture;
			float3 worldRefl;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_MainTexture, IN.uv_MainTexture).rgb;
			#ifdef ENABLE_COLOR
				o.Albedo *= _Color.rgb;
			#endif
			#ifdef ENABLE_EMISSION
                o.Emission = texCUBE(_myCube, IN.worldRefl);
            #endif
		}
		ENDCG
	}
	FallBack "Diffuse"
}