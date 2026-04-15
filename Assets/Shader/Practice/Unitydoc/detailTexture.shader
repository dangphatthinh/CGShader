Shader "MyShader/Unitydoc/detailTexture"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
        _DetailTex("Detail Texture", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _DetailTex;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_DetailTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Albedo *= tex2D(_DetailTex, IN.uv_DetailTex).rgb * 2;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
