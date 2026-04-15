Shader "MyShader/BasicBlinn"
{
    Properties
    {
        _myColor("Model Color", Color) = (1,1,1,1)
        _SpecColor("Specular Color", Color) = (1,1,1,1)
        _Spec("Specular Size", Range(0,1)) = 0.5
        _Gloss("Specular Power", Range(0,1)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf BlinnPhong

        float4 _myColor;
        half _Spec;
        half _Gloss;
        //_SpecColor is already run be the program, dont need to do any thing with it

        struct Input
        {
            float4 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _myColor.rgb;
            o.Specular = _Spec;
            o.Gloss = _Gloss;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
