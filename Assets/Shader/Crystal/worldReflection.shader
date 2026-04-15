Shader "Crystal/worldReflection"
{
    Properties
    {
        _texture("Main Texture", 2D) = "white" {}
        _cubeTex("Cube Map", CUBE) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _texture;
        samplerCUBE _cubeTex;

        struct Input
        {
            float2 uv_texture;
            float3 worldRefl;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_texture, IN.uv_texture).rgb;
            o.Emission = texCUBE(_cubeTex, WorldReflectionVector(IN, o.Normal)).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
