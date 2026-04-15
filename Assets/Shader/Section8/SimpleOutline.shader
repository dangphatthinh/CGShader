Shader "MyShader/Section8/SimpleOutline"
{
    Properties
    {
        _Color ("Outline Color", Color) = (1,1,1,1)
        _MainTex ("Main Texture", 2D) = "white" {}
        _Outline ("Outline Width", Range(0.002,0.1)) = 0.005       
    }
    SubShader
    {
       Tags{"Queue" = "Transparent"}
       ZWrite off

       CGPROGRAM
       #pragma surface surf Lambert vertex:vert
       struct Input
       {
              float2 uv_MainTex;
       };

       float _Outline;
       sampler2D _MainTex;
       fixed4 _Color;

       void vert(inout appdata_full v)
       {
              v.vertex.xyz += v.normal * _Outline;
       }

       void surf(Input IN, inout SurfaceOutput o)
       {
              o.Emission = _Color.rgb;
       }
       ENDCG

       ZWrite on
       CGPROGRAM
       #pragma surface surf Lambert
       struct Input
       {
              float2 uv_MainTex;
       };

       sampler2D _MainTex;
       
       void surf(Input IN, inout SurfaceOutput o)
       {
              o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
       }
       ENDCG
    }
    FallBack "Diffuse"
}
