Shader "MyShader/RimLighting"
{
    Properties
    {
        _myRimColor("RimColor", Color) = (0, 0.5, 0.5, 0)
        _myPower("Strengh of Rim Light", Range(0, 5))= 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        fixed4 _myRimColor;
        half _myPower;

        struct Input
        {
            float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _myRimColor.rgb * pow(rim, _myPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
