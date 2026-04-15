Shader "Practice2/DotProduct2"
{
	Properties
	{
		_myColor("Rim Color", Color) = (1, 1, 1, 1)
		_rimPower("Rim Power", Range(0, 5)) = 1
	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		fixed4 _myColor;
		half _rimPower;

		struct Input
		{
			float3 viewDir;
			float3 worldPos;
		};
		void surf(Input IN, inout SurfaceOutput o)
		{
			half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
			//o.Emission = _myColor.rgb * pow(rim, _rimPower);
			o.Emission = frac(IN.worldPos.y * 2) > 0.5 ? float3(1,0,0)*rim : float3(0,0,1)*rim;
		}
		ENDCG
	}
	Fallback "Diffuse"
}