Shader "Crystal/BasicCrystal"
{
    Properties
    {
        _Texture("Main Texture", 2D) = "white" {}
        _Color("Crystal Color", Color) = (1, 1, 1, 1)
        _myPower("Strengh of Rim", Range(0, 5)) = 1
    }
    SubShader
    {
        Tags{"Queue" = "Transparent"}

        Pass
        {
            ZWrite On
            ColorMask 0
        }

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        sampler2D _Texture;
        fixed4 _Color;
        float _myPower;

        struct Input
        {
            float2 uv_Texture;
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            fixed4 tex = tex2D(_Texture, IN.uv_Texture);
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = tex.rgb * pow(rim, _myPower) * 5;
            o.Alpha = pow(rim, _myPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
