Shader "MyShader/BlendTwoImage"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _DecalTex ("Decal Texture", 2D) = "white" {}
        [Toggle] _ShowDecal ("Show Decal", Float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Geometry" }
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _DecalTex;
        float _ShowDecal;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_DecalTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 a = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 b = tex2D (_DecalTex, IN.uv_DecalTex) * _ShowDecal;
            //o.Albedo = b.r > 0.9 ? b.rgb : a.rgb;
            //o.Albedo = a.rgb + b. rgb;
            o.Albedo = (a.rgb * (1 - b.a)) + (b.rgb * b.a);
            //o.Normal = b.a > 0.9 ? UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex)) : 0;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
