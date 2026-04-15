Shader "Practice/ToggleTest"
{
    Properties
    {
        _myRange ("Example Range", Range(0, 255)) = 1
        _myTex ("Example Texture", 2D) = "white" {}
        _myCube ("Example Cube", CUBE) = "" {}
        [Toggle(ENABLE_EMISSION)] _isEmissive("Is emissive", Float) = 0
    }
    
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        #pragma shader_feature ENABLE_EMISSION
        
        struct Input
        {
            float2 uv_myTex;
            float3 worldRefl;
        };
        
        half _myRange;
        sampler2D _myTex;
        samplerCUBE _myCube;
        
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_myTex, IN.uv_myTex) * _myRange; // smearing
            
            #ifdef ENABLE_EMISSION
                o.Emission = texCUBE(_myCube, IN.worldRefl); // smearing
            #endif
        }
        ENDCG
    }
    
    Fallback "Diffuese"
}