Shader "MyShader/LogicalcutOff"
{
    Properties
    {
        _myDiffuse ("Diffuse", 2D) = "white" {}
        _myBump ("BumpMap", 2D) = "white" {}
        _mySlider ("Bump Amount", Range(0, 10)) = 1
        _myBright ("Brightness", Range(0, 10)) = 1
        _myCube ("Cube Map", CUBE) = "white" {}
    }
    SubShader
    {
        Tags { "Queue" = "Geometry+100"}
        ZWrite Off

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myDiffuse;
        sampler2D _myBump;
        half _mySlider;
        half _myBright; 
        samplerCUBE _myCube;

        struct Input
        {
            float2 uv_myDiffuse;
            float2 uv_myBump;
            float3 worldRefl; INTERNAL_DATA
            float3 worldPos;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)) * _myBright;
            o.Normal *= float3(_mySlider, _mySlider, 1);
            clip (frac(IN.worldPos.y)-0.5);
            o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb;
            //o.Emission = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
