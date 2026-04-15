Shader "MyShader/Section8/Extrude"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
        _Amount("Extrude Amount", Range(-1, 1)) = 0.01
    }
    SubShader
    {
        CGPROGRAM
        //add shadow automatically generate a shadow caster in surface shader
        #pragma surface surf Lambert vertex:vert addshadow 
        struct Input
        {
            float2 uv_MainTex;
        };

        struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float2 texcoord : TEXCOORD0;
        };

        sampler2D _MainTex;
        float _Amount;

        void vert(inout appdata v)
        {
            v.vertex.xyz += v.normal * _Amount;
        }

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
