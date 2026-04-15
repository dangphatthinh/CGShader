Shader "MyShader/ScrollingTexture"
{
    Properties
    {
        _WaterTex("Water Texture", 2D) = "white" {}
        _FoamTex("Foam Texture", 2D) = "white" {}
        _ScrollX("Scroll X", Range(-5, 5)) = 1
        _ScrollY("Scroll Y", Range(-5, 5)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _WaterTex;
        sampler2D _FoamTex;
        float _ScrollX;
        float _ScrollY;

        struct Input
        {
            float2 uv_WaterTex;
            float2 uv_FoamTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            _ScrollX *= _Time;
            _ScrollY *= _Time;
            float3 water = tex2D(_WaterTex, IN.uv_WaterTex + float2(_ScrollX, _ScrollY)).rgb;
            float3 foam = tex2D(_FoamTex, IN.uv_FoamTex + float2(_ScrollX/2, _ScrollY/2)).rgb;
            o.Albedo = (water + foam)/2;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
