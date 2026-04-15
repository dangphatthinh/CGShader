Shader "Practice2/LightingModelPractice"
{
    Properties
    {
        _myDiffuse("Diffuse Color", Color) = (1, 1, 1, 1)
        _SpecColor("Sprcular Color", Color) = (1, 1, 1, 1)
        _specSize("Specular Size", Range(0, 1))= 0.5
        _specPower("Specular Power", Range(0, 1)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf BlinnPhong
        
        fixed4 _myDiffuse;
        half _specPower;
        half _specSize;

        struct Input
        {
            float4 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _myDiffuse.rgb;
            o.Specular = _specSize;
            o.Gloss = _specPower;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
